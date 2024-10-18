# 1 "generic_queue.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/opt/microchip/xc8/v2.45/pic/include/language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "generic_queue.c" 2
# 1 "./generic_queue.h" 1



# 1 "/opt/microchip/xc8/v2.45/pic/include/c99/stdint.h" 1 3



# 1 "/opt/microchip/xc8/v2.45/pic/include/c99/musl_xc8.h" 1 3
# 5 "/opt/microchip/xc8/v2.45/pic/include/c99/stdint.h" 2 3
# 26 "/opt/microchip/xc8/v2.45/pic/include/c99/stdint.h" 3
# 1 "/opt/microchip/xc8/v2.45/pic/include/c99/bits/alltypes.h" 1 3
# 133 "/opt/microchip/xc8/v2.45/pic/include/c99/bits/alltypes.h" 3
typedef unsigned short uintptr_t;
# 148 "/opt/microchip/xc8/v2.45/pic/include/c99/bits/alltypes.h" 3
typedef short intptr_t;
# 164 "/opt/microchip/xc8/v2.45/pic/include/c99/bits/alltypes.h" 3
typedef signed char int8_t;




typedef short int16_t;




typedef __int24 int24_t;




typedef long int32_t;





typedef long long int64_t;
# 194 "/opt/microchip/xc8/v2.45/pic/include/c99/bits/alltypes.h" 3
typedef long long intmax_t;





typedef unsigned char uint8_t;




typedef unsigned short uint16_t;




typedef __uint24 uint24_t;




typedef unsigned long uint32_t;





typedef unsigned long long uint64_t;
# 235 "/opt/microchip/xc8/v2.45/pic/include/c99/bits/alltypes.h" 3
typedef unsigned long long uintmax_t;
# 27 "/opt/microchip/xc8/v2.45/pic/include/c99/stdint.h" 2 3

typedef int8_t int_fast8_t;

typedef int64_t int_fast64_t;


typedef int8_t int_least8_t;
typedef int16_t int_least16_t;

typedef int24_t int_least24_t;
typedef int24_t int_fast24_t;

typedef int32_t int_least32_t;

typedef int64_t int_least64_t;


typedef uint8_t uint_fast8_t;

typedef uint64_t uint_fast64_t;


typedef uint8_t uint_least8_t;
typedef uint16_t uint_least16_t;

typedef uint24_t uint_least24_t;
typedef uint24_t uint_fast24_t;

typedef uint32_t uint_least32_t;

typedef uint64_t uint_least64_t;
# 148 "/opt/microchip/xc8/v2.45/pic/include/c99/stdint.h" 3
# 1 "/opt/microchip/xc8/v2.45/pic/include/c99/bits/stdint.h" 1 3
typedef int16_t int_fast16_t;
typedef int32_t int_fast32_t;
typedef uint16_t uint_fast16_t;
typedef uint32_t uint_fast32_t;
# 149 "/opt/microchip/xc8/v2.45/pic/include/c99/stdint.h" 2 3
# 5 "./generic_queue.h" 2
# 1 "/opt/microchip/xc8/v2.45/pic/include/c99/stddef.h" 1 3
# 19 "/opt/microchip/xc8/v2.45/pic/include/c99/stddef.h" 3
# 1 "/opt/microchip/xc8/v2.45/pic/include/c99/bits/alltypes.h" 1 3
# 24 "/opt/microchip/xc8/v2.45/pic/include/c99/bits/alltypes.h" 3
typedef long int wchar_t;
# 128 "/opt/microchip/xc8/v2.45/pic/include/c99/bits/alltypes.h" 3
typedef unsigned size_t;
# 138 "/opt/microchip/xc8/v2.45/pic/include/c99/bits/alltypes.h" 3
typedef int ptrdiff_t;
# 20 "/opt/microchip/xc8/v2.45/pic/include/c99/stddef.h" 2 3
# 6 "./generic_queue.h" 2
# 1 "/opt/microchip/xc8/v2.45/pic/include/c99/stdbool.h" 1 3
# 7 "./generic_queue.h" 2




typedef struct {
    uint8_t buffer[15 * 6];
    size_t element_size;
    uint8_t front;
    uint8_t rear;
    uint8_t size;
} GenericQueue;

void GenericQueue_Init(GenericQueue *q, size_t element_size);
int GenericQueue_IsEmpty(GenericQueue *q);
int GenericQueue_IsFull(GenericQueue *q);
void GenericQueue_Enqueue(GenericQueue *q, const void *item);
void GenericQueue_Dequeue(GenericQueue *q, void *item);
void GenericQueue_Remove(GenericQueue *q, const void *item);
_Bool GenericQueue_Contains(GenericQueue *q, const void *item);
void GenericQueue_CopyToArray(GenericQueue *q, void *array);
# 2 "generic_queue.c" 2
# 1 "/opt/microchip/xc8/v2.45/pic/include/c99/string.h" 1 3
# 10 "/opt/microchip/xc8/v2.45/pic/include/c99/string.h" 3
# 1 "/opt/microchip/xc8/v2.45/pic/include/c99/features.h" 1 3
# 11 "/opt/microchip/xc8/v2.45/pic/include/c99/string.h" 2 3
# 25 "/opt/microchip/xc8/v2.45/pic/include/c99/string.h" 3
# 1 "/opt/microchip/xc8/v2.45/pic/include/c99/bits/alltypes.h" 1 3
# 421 "/opt/microchip/xc8/v2.45/pic/include/c99/bits/alltypes.h" 3
typedef struct __locale_struct * locale_t;
# 26 "/opt/microchip/xc8/v2.45/pic/include/c99/string.h" 2 3

void *memcpy (void *restrict, const void *restrict, size_t);
void *memmove (void *, const void *, size_t);
void *memset (void *, int, size_t);
int memcmp (const void *, const void *, size_t);
void *memchr (const void *, int, size_t);

char *strcpy (char *restrict, const char *restrict);
char *strncpy (char *restrict, const char *restrict, size_t);

char *strcat (char *restrict, const char *restrict);
char *strncat (char *restrict, const char *restrict, size_t);

int strcmp (const char *, const char *);
int strncmp (const char *, const char *, size_t);

int strcoll (const char *, const char *);
size_t strxfrm (char *restrict, const char *restrict, size_t);

char *strchr (const char *, int);
char *strrchr (const char *, int);

size_t strcspn (const char *, const char *);
size_t strspn (const char *, const char *);
char *strpbrk (const char *, const char *);
char *strstr (const char *, const char *);
char *strtok (char *restrict, const char *restrict);

size_t strlen (const char *);

char *strerror (int);




char *strtok_r (char *restrict, const char *restrict, char **restrict);
int strerror_r (int, char *, size_t);
char *stpcpy(char *restrict, const char *restrict);
char *stpncpy(char *restrict, const char *restrict, size_t);
size_t strnlen (const char *, size_t);
char *strdup (const char *);
char *strndup (const char *, size_t);
char *strsignal(int);
char *strerror_l (int, locale_t);
int strcoll_l (const char *, const char *, locale_t);
size_t strxfrm_l (char *restrict, const char *restrict, size_t, locale_t);




void *memccpy (void *restrict, const void *restrict, int, size_t);
# 3 "generic_queue.c" 2

void GenericQueue_Init(GenericQueue *q, size_t element_size) {
    q->element_size = element_size;
    q->front = 0;
    q->rear = 0;
    q->size = 0;
}

int GenericQueue_IsEmpty(GenericQueue *q) {
    return (q->size == 0);
}

int GenericQueue_IsFull(GenericQueue *q) {
    return (q->size == 15);
}

void GenericQueue_Enqueue(GenericQueue *q, const void *item) {
    if (!GenericQueue_IsFull(q)) {
        memcpy(&q->buffer[q->rear * q->element_size], item, q->element_size);
        q->rear = (q->rear + 1) % 15;
        q->size++;
    }
}

void GenericQueue_Dequeue(GenericQueue *q, void *item) {
    if (!GenericQueue_IsEmpty(q)) {
        memcpy(item, &q->buffer[q->front * q->element_size], q->element_size);
        q->front = (q->front + 1) % 15;
        q->size--;
    }
}

void GenericQueue_Remove(GenericQueue *q, const void *item) {
    if (!GenericQueue_IsEmpty(q)) {
        for (uint8_t i = q->front; i != q->rear; i = (i + 1) % 15) {
            if (memcmp(&q->buffer[i * q->element_size], item, q->element_size) == 0) {
                for (uint8_t j = i; j != q->rear; j = (j + 1) % 15) {
                    memcpy(&q->buffer[j * q->element_size],
                           &q->buffer[(j + 1) % 15 * q->element_size],
                           q->element_size);
                }
                q->rear = (q->rear - 1 + 15) % 15;
                q->size--;
                break;
            }
        }
    }
}

_Bool GenericQueue_Contains(GenericQueue *q, const void *item) {
    if (!GenericQueue_IsEmpty(q)) {
        for (uint8_t i = q->front; i != q->rear; i = (i + 1) % 15) {
            if (memcmp(&q->buffer[i * q->element_size], item, q->element_size) == 0) {
                return 1;
            }
        }
    }
    return 0;
}

void GenericQueue_CopyToArray(GenericQueue *q, void *array) {
    uint8_t index = q->front;
    uint8_t count = 0;
    while (count < q->size) {
        memcpy((char*)array + (count * q->element_size),
               &q->buffer[index * q->element_size],
               q->element_size);
        index = (index + 1) % 15;
        count++;
    }
}
