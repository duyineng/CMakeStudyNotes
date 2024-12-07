#include <iostream>
#include <vector>
using namespace std;

void insertionSort(vector<int>& vec)
{
    int size = vec.size();
    for (int i = 1; i < size; ++i)
    {
        int key = vec[i];
        int j = i - 1;  
        while (j >= 0 && vec[j] > key)
        {
            vec[j + 1] = vec[j];
            j--;
        }
        vec[j + 1] = key;
    }
}