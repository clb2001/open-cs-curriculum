import numpy as np

def softmax(scores):
    exp_scores = np.exp(scores)
    return exp_scores / np.sum(exp_scores, axis=1, keepdims = True)

def loss(y_pred, y_true):
    m = y_true.shape[0]
    log_probs = -np.log(y_pred[range(m), y_true])
    loss = np.sum(log_probs) / m
    return loss

scores = np.array([[0.8, 0.1, 0.1], [0.1, 0.5, 1.0], [0.8, 0.6, 0.9]])
labels = np.array([1, 0, 0])
probs = softmax(scores)
loss = loss(probs, labels)
print("loss", loss)