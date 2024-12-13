#include <iostream>
#include <vector>
#include "../../src/sort/sort.h"  

int main()
{
    // 定义待排序的数组
    std::vector<int> vec1 = {64, 25, 12, 22, 11};
    std::vector<int> vec2 = {29, 10, 14, 37, 13};

    // 打印原始数组
    std::cout << "Original array for selectionSort: ";
    for (int num : vec1)
        std::cout << num << " ";
    std::cout << std::endl;

    std::cout << "Original array for insertionSort: ";
    for (int num : vec2)
        std::cout << num << " ";
    std::cout << std::endl;

    // 调用 selectionSort
    selectionSort(vec1);
    std::cout << "Sorted array using selectionSort: ";
    for (int num : vec1)
        std::cout << num << " ";
    std::cout << std::endl;

    // 调用 insertionSort
    insertionSort(vec2);
    std::cout << "Sorted array using insertionSort: ";
    for (int num : vec2)
        std::cout << num << " ";
    std::cout << std::endl;

    return 0;
}
