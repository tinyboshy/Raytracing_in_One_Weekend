#ifndef HITABLEH
#define HITABLEH

#include "ray.h"

class material;

// 衝突時に計算される値
struct hit_record {
    float t;
    vec3 p; // 衝突した座標
    vec3 normal; // 法線
    material* mat_ptr;
};

class hitable {
public:
    virtual bool hit(const ray& r, float t_min, float t_max, hit_record& rec) const = 0;
};

#endif