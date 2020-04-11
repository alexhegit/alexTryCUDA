# Hello CUDA
Ye HE , 4/11/2020



My1st CUDA example.

## Compile
```
$nvcc hello.cu -o hello
```



Nsight compute profiling

```
$ nv-nsight-cu-cli hello
```

![image-20200411180209324](C:\Users\yeh\AppData\Roaming\Typora\typora-user-images\image-20200411180209324.png)



Or with nsight-compute GUI opened the report after profiling done.

```
$ nv-nsight-cu-cli --open-in-ui hello
```



## Nsigth systems profiling

```
nsys profile -t cuda,osrt -o hello -w true --stats=true ./hello
```

You will get the report file and output in termial like these below.

![image-20200411180355269](C:\Users\yeh\AppData\Roaming\Typora\typora-user-images\image-20200411180355269.png)



