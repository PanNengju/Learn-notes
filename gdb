gdb   -g


gdb core dump
1. 使用-g参数编译程序
    int main(void)
    {
        char *str = "he"; 
        str[0] = 'a';
        return 0;
    }
    假设编译后的可执行文件为test
    
2. 设置core dump文件
    1）设置ulimit
        linux下默认是不产生core文件的，要用ulimit -c unlimited放开
        ulimit -c unlimited
    2）设置core dump的输出文件
        为避免开发板存储空间不足的问题，一般将输出文件输出到nfs挂载的目录。
        echo '/home/core-%p-%e' > "/proc/sys/kernel/core_pattern" 
        在开发板中执行test，此时在/home/目录下就会产生一个core dump文件：core-1114-test。
        
3）启动gdb调试
    gdb test core-1114-test
    
    
