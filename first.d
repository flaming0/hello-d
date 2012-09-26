import std.stdio;
    
void bubbleSort(T)(T[] array)
{
    foreach (i; 0 .. array.length)
    {
        foreach (j; 0 .. array.length - i - 1)
        {
            if (array[j] > array[j + 1])
            {
                T temp = array[j];
                array[j] = array[j + 1];
                array[j + 1] = temp;
            }
        }
    }
}
    
void main()
{
    int[] arr = [ 7, 6, 5, 4, 3, 2, 1 ];
    
    bubbleSort(arr);
    
    foreach(it; arr)
        writeln(it);
}
