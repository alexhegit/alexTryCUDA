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



Or with Nsight Compute GUI opened the report after profiling done.

```
$ nv-nsight-cu-cli --open-in-ui hello
```

Then Nsight Compute will launched with the report opened. Or you can open it by hand.

The Nsight Compute may provide the details in many different section and recommendations for the bottle neck like bellow,

- GPU Speed Of Light(SOL)

![image-20200411182216305](C:\Users\yeh\AppData\Roaming\Typora\typora-user-images\image-20200411182216305.png)

![image-20200411182336925](C:\Users\yeh\AppData\Roaming\Typora\typora-user-images\image-20200411182336925.png)

- Launch Statistics

![image-20200411182443344](C:\Users\yeh\AppData\Roaming\Typora\typora-user-images\image-20200411182443344.png)

- Occupancy

![image-20200411182714341](C:\Users\yeh\AppData\Roaming\Typora\typora-user-images\image-20200411182714341.png)



## Nsigth systems profiling

```
nsys profile -t cuda,osrt -o hello -w true --stats=true ./hello
```

You will get the report file and also stats output in terminal like these below.

![image-20200411180355269](C:\Users\yeh\AppData\Roaming\Typora\typora-user-images\image-20200411180355269.png)



The report file will be saved like *.qdrep that you can open it by Nsight Systems APP. The GUI show many difference timelines of both CPU and GPU.

![image-20200411183055145](C:\Users\yeh\AppData\Roaming\Typora\typora-user-images\image-20200411183055145.png)



Please refer to the documents of Nsight to get more usage details from NVIDIA website.