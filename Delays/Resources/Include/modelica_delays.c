
#ifndef DELAYS_LIBRARY
#define DELAYS_LIBRARY
#include <math.h>

#include "ModelicaUtilities.h"
#ifndef oom
#define oom() ModelicaError("Out of memory")
#endif
#include "utarray.h"

typedef struct {
    int v;
    double x;
} Delayed;

typedef struct {
    UT_array *arr;
} Delays_BooleanDelayer;

UT_icd booleanDelayer_icd = {sizeof (Delayed), NULL, NULL, NULL};

typedef struct {
    UT_array *arr;
} Delays_IntegerDelayer;

UT_icd integerDelayer_icd = {sizeof (Delayed), NULL, NULL, NULL};

void* Delays_BooleanDelayer_construct() {
    Delays_BooleanDelayer* obj = (Delays_BooleanDelayer*) malloc(sizeof (Delays_BooleanDelayer));
    utarray_new(obj->arr, &booleanDelayer_icd);
    return (void*) obj;
}

void Delays_BooleanDelayer_destruct(void* delayer) {
    Delays_BooleanDelayer* obj;
    obj = (Delays_BooleanDelayer*) delayer;
    utarray_free(obj->arr);
    free(obj);
}

int Delays_BooleanDelayer_push(void* delayer, int v, double x) {
    Delays_BooleanDelayer* obj;
    Delayed d;
    d.v = v;
    d.x = x;
    obj = (Delays_BooleanDelayer*) delayer;
    utarray_push_back(obj->arr, &d);
    return utarray_len(obj->arr);
}

int Delays_BooleanDelayer_pop(void* delayer, int *size) {
    Delays_BooleanDelayer* obj;
    Delayed* d;
    int v;
    obj = (Delays_BooleanDelayer*) delayer;
    if (utarray_len(obj->arr) > 0) {
        d = (Delayed*) utarray_eltptr(obj->arr, 0);
        v = d->v;
        utarray_erase(obj->arr, 0, 1);
        *size = utarray_len(obj->arr);
        return v;
    }
    ModelicaError("Calling pop() on empty array");
    *size = 0;
    return 0;
}

double Delays_BooleanDelayer_transport(void* delayer, double x) {
    Delays_BooleanDelayer* obj;
    Delayed* d;
    if (delayer) {
        obj = (Delays_BooleanDelayer*) delayer;
        if (obj->arr) {
            if (utarray_len(obj->arr) > 0) {
                d = (Delayed*) utarray_eltptr(obj->arr, 0);
                return x - d->x;
            }
        }
    }
    return 0;
}

double Delays_BooleanDelayer_nextTime(void* delayer, double tDelay) {
    Delays_BooleanDelayer* obj;
    Delayed* d;
    obj = (Delays_BooleanDelayer*) delayer;
    if (utarray_len(obj->arr) > 0) {
        d = (Delayed*) utarray_eltptr(obj->arr, 0);
        return d->x + tDelay;
    }
    return DBL_MAX;
}

void* Delays_IntegerDelayer_construct() {
    Delays_IntegerDelayer* obj = (Delays_IntegerDelayer*) malloc(sizeof (Delays_IntegerDelayer));
    utarray_new(obj->arr, &integerDelayer_icd);
    return (void*) obj;
}

void Delays_IntegerDelayer_destruct(void* delayer) {
    Delays_IntegerDelayer* obj;
    obj = (Delays_IntegerDelayer*) delayer;
    utarray_free(obj->arr);
    free(obj);
}

int Delays_IntegerDelayer_push(void* delayer, int v, double x) {
    Delays_IntegerDelayer* obj;
    Delayed d;
    d.v = v;
    d.x = x;
    obj = (Delays_IntegerDelayer*) delayer;
    utarray_push_back(obj->arr, &d);
    //ModelicaFormatMessage("push(%i,%f,%i)\n", v, x, utarray_len(obj->arr));
    return utarray_len(obj->arr);
}

int Delays_IntegerDelayer_pop(void* delayer, int *size, int *iteration) {
    Delays_IntegerDelayer* obj;
    Delayed* d;
    int v;
    int i;
    double x;
    obj = (Delays_IntegerDelayer*) delayer;
    *iteration = 0;
    if (utarray_len(obj->arr) > 0) {
        d = (Delayed*) utarray_eltptr(obj->arr, 0);
        v = d->v;
        x = d->x;
        utarray_erase(obj->arr, 0, 1);
        *size = utarray_len(obj->arr);
        for (i = 0; i < (*size); i++) {
            d = (Delayed*) utarray_eltptr(obj->arr, i);
            if (fabs(x - (d->x)) < 1e-8) {
                (*iteration)++;
            }
        }
        //ModelicaFormatMessage("pop(%i,%f,%i,%i)\n", v, x, *size, *iteration);
        return v;
    }
    ModelicaError("Calling pop() on empty array");
    *size = 0;
    return 0;
}

double Delays_IntegerDelayer_transport(void* delayer, double x) {
    Delays_IntegerDelayer* obj;
    Delayed* d;
    if (delayer) {
        obj = (Delays_IntegerDelayer*) delayer;
        if (obj->arr) {
            if (utarray_len(obj->arr) > 0) {
                d = (Delayed*) utarray_eltptr(obj->arr, 0);
                return x - d->x;
            }
        }
    }
    return 0;
}

double Delays_IntegerDelayer_nextTime(void* delayer, double tDelay) {
    Delays_IntegerDelayer* obj;
    Delayed* d;
    obj = (Delays_IntegerDelayer*) delayer;
    if (utarray_len(obj->arr) > 0) {
        d = (Delayed*) utarray_eltptr(obj->arr, 0);
        return d->x + tDelay;
    }
    return DBL_MAX;
}


#endif
