#include <iostream>
#include <vector>

#include "CGL/vector2D.h"

#include "mass.h"
#include "rope.h"
#include "spring.h"

namespace CGL {

    Rope::Rope(Vector2D start, Vector2D end, int num_nodes, float node_mass, float k, vector<int> pinned_nodes)
    {
        // TODO (Part 1): Create a rope starting at `start`, ending at `end`, and containing `num_nodes` nodes.
        // the position of the first node is start, and the position of the last node is end  
        for (int i = 0; i < num_nodes; i++) {
            double t = (double)i / (num_nodes - 1);
            Vector2D pos(start.x * (1 - t) + end.x * t, start.y * (1 - t) + end.y * t);
            masses.push_back(new Mass(pos, node_mass, false));
        }
        for (int i = 0; i < num_nodes - 1; i++) {
            springs.push_back(new Spring(masses[i], masses[i + 1], k));
        }
        // 不是所有的点都要固定
        for (auto &i : pinned_nodes) {
            masses[i]->pinned = true;
        }
    }

    void Rope::simulateEuler(float delta_t, Vector2D gravity)
    {
        for (auto &s : springs)
        {
            // TODO (Part 2): Use Hooke's law to calculate the force on a node
            float dist = (s->m2->position - s->m1->position).norm();
            s->m1->forces += -s->k * (s->m1->position - s->m2->position) / dist * (dist - s->rest_length);
            s->m2->forces += -s->k * (s->m2->position - s->m1->position) / dist * (dist - s->rest_length);
        }

        for (auto &m : masses)
        {
            if (!m->pinned)
            {
                // TODO (Part 2): Add the force due to gravity, then compute the new velocity and position
                // gravity is g
                // semi-implicit method
                Vector2D a = m->forces / m->mass + gravity;
                m->velocity += a * delta_t;
                m->position += m->velocity * delta_t;

                // // explicit method
                // Vector2D a = m->forces / m->mass + gravity;
                // m->position += m->velocity * delta_t;  
                // m->velocity += a * delta_t;              
                // TODO (Part 2): Add global damping
            
            }

            // Reset all forces on each mass
            m->forces = Vector2D(0, 0);
        }
    }

    void Rope::simulateVerlet(float delta_t, Vector2D gravity)
    {
        for (auto &s : springs)
        {
            // TODO (Part 3): Simulate one timestep of the rope using explicit Verlet （solving constraints)
            float dist = (s->m2->position - s->m1->position).norm();
            s->m1->forces += -s->k * (s->m1->position - s->m2->position) / dist * (dist - s->rest_length);
            s->m2->forces += -s->k * (s->m2->position - s->m1->position) / dist * (dist - s->rest_length);
        }

        for (auto &m : masses)
        {
            if (!m->pinned)
            {
                Vector2D temp_position = m->position;
                // TODO (Part 3.1): Set the new position of the rope mass
                // Vector2D a = m->forces / m->mass + gravity;
                // m->position = temp_position + (temp_position - m->last_position) + a * delta_t * delta_t;
                // m->last_position = temp_position;

                // // TODO (Part 4): Add global Verlet damping
                float dampen_factor = 0.00005;
                Vector2D a = m->forces / m->mass + gravity;
                m->position = temp_position + (1 - dampen_factor) * (temp_position - m->last_position) + a * delta_t * delta_t;
                m->last_position = temp_position;
            }
            m->forces = Vector2D(0, 0);
        }
    }
}
