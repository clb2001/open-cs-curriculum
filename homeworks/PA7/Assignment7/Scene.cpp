//
// Created by Göksu Güvendiren on 2019-05-14.
//

#include "Scene.hpp"


void Scene::buildBVH() {
    printf(" - Generating BVH...\n\n");
    this->bvh = new BVHAccel(objects, 1, BVHAccel::SplitMethod::NAIVE);
}

Intersection Scene::intersect(const Ray &ray) const
{
    return this->bvh->Intersect(ray);
}

void Scene::sampleLight(Intersection &pos, float &pdf) const
{
    float emit_area_sum = 0;
    for (uint32_t k = 0; k < objects.size(); ++k) {
        if (objects[k]->hasEmit()){
            emit_area_sum += objects[k]->getArea();
        }
    }
    float p = get_random_float() * emit_area_sum;
    emit_area_sum = 0;
    for (uint32_t k = 0; k < objects.size(); ++k) {
        if (objects[k]->hasEmit()){
            emit_area_sum += objects[k]->getArea();
            if (p <= emit_area_sum){
                objects[k]->Sample(pos, pdf);
                break;
            }
        }
    }
}

bool Scene::trace(
        const Ray &ray,
        const std::vector<Object*> &objects,
        float &tNear, uint32_t &index, Object **hitObject)
{
    *hitObject = nullptr;
    for (uint32_t k = 0; k < objects.size(); ++k) {
        float tNearK = kInfinity;
        uint32_t indexK;
        Vector2f uvK;
        if (objects[k]->intersect(ray, tNearK, indexK) && tNearK < tNear) {
            *hitObject = objects[k];
            tNear = tNearK;
            index = indexK;
        }
    }


    return (*hitObject != nullptr);
}

// Implementation of Path Tracing
Vector3f Scene::castRay(const Ray &ray, int depth) const
{
    // TO DO Implement Path Tracing Algorithm here
    // pseudocode:
    // shade (p, wo)
    //   sampleLight ( inter , pdf_light )
    //   Get x, ws , NN , emit from inter
    //   Shoot a ray from p to x
    //   If the ray is not blocked in the middle
    //     L_dir = emit * eval (wo , ws , N) * dot (ws , N) * dot (ws , NN) / |x-p|^2 / pdf_light
    //   L_indir = 0.0
    //   Test Russian Roulette with probability RussianRoulette
    //   wi = sample (wo , N)
    //   Trace a ray r(p, wi)
    //   If ray r hit a non - emitting object at q
    //     L_indir = shade (q, wi) * eval (wo , wi , N) * dot (wi , N) / pdf (wo , wi , N) / RussianRoulette
    //   Return L_dir + L_indir
    Intersection p_inter = intersect(ray);
    if (!p_inter.happened) {
        return Vector3f();
    }
    if (p_inter.m->hasEmission()) {
        return p_inter.m->getEmission();
    }

    Vector3f L_dir, L_indir;
    L_dir = 0.0;
    float pdf_light = M_1_PI / 2;
    Intersection x_inter;
    //   sampleLight ( inter , pdf_light )
    sampleLight(x_inter, pdf_light);
    //   Get x, ws , NN , emit from inter
    Vector3f p = p_inter.coords;
    Vector3f x = x_inter.coords;
    Vector3f N = normalize(p_inter.normal);
    Vector3f NN = normalize(x_inter.normal);
    Vector3f ws_dir = normalize(x - p);
    float ws_distance = (x - p).norm();
    Vector3f emit = x_inter.emit;
    
    //   Shoot a ray from p to x
    Ray ws_ray(p, ws_dir);
    Intersection ws_ray_inter = intersect(ws_ray);
    //   If the ray is not blocked in the middle
    if (ws_ray_inter.distance - ws_distance >= -EPSILON) {
        //     L_dir = emit * eval (wo , ws , N) * dot (ws , N) * dot (ws , NN) / |x-p|^2 / pdf_light
        L_dir = emit * p_inter.m->eval(ray.direction, ws_ray.direction, N) *
                dotProduct(ws_ray.direction, N) * dotProduct(-ws_ray.direction, NN) /
                std::pow(ws_distance, 2) / pdf_light;
    }
    //   Test Russian Roulette with probability RussianRoulette
    if (get_random_float() > RussianRoulette) {
        return L_dir;
    }
    L_indir = 0.0;
    //   wi = sample (wo , N)
    Vector3f wi_dir = normalize(p_inter.m->sample(ray.direction, N));
    //   Trace a ray r(p, wi)
    Ray wi_ray(p, wi_dir);
    Intersection q = intersect(wi_ray);
    //   If ray r hit a non - emitting object at q
    if (q.happened && !q.m->hasEmission()) {
        //     L_indir = shade (q, wi) * eval (wo , wi , N) * dot (wi , N) / pdf (wo , wi , N) / RussianRoulette
        L_indir = castRay(wi_ray, depth + 1) * p_inter.m->eval(ray.direction, wi_ray.direction, N) *
                dotProduct(wi_ray.direction, N) / p_inter.m->pdf(ray.direction, wi_ray.direction, N) / RussianRoulette;
    }
    //   Return L_dir + L_indir
    return L_dir + L_indir;
}