on   error   resume   Next       

Dim   a

a   =   True    

set   WshShell   =   WScript.CreateObject("WScript.Shell") 

set fso=createobject("scripting.filesystemobject")

Do   While   a     

set   http   =   CreateObject("Microsoft.XMLHTTP")      

http.open   "GET","http://localhost:8080?a=" & now,false 

http.send       
'set file=fso.opentextfile("D:\back-up-version\auto-start-up-log\log.txt",8,true)
'file.writeline "请求前：status:" & http.Status

if   http.Status <> 200   Then  

'WshShell.Run("shutdown.bat")     

'WScript.Sleep(5000)          
WScript.Sleep(10000) 
WshShell.Run("startup.bat")  

if (fso.fileexists("D:\back-up-version\auto-start-up-log\log.txt")) then
'打开文件，参数1为forreading，2为forwriting，8为appending
set file=fso.opentextfile("D:\back-up-version\auto-start-up-log\log.txt",8,true)
file.writeline "tomcat在" 
file.writeline now
file.writeline "自动重启了一次:" & http.Status 
ts.writeblanklines 2 
file.close   
else
'创建文件，参数1为forreading，2为forwriting，8为appending
set file=fso.createtextfile( "D:\back-up-version\auto-start-up-log\log.txt",2,ture)

'写入文件内容，有三种方法：write(x)写入x个字符，writeline写入换行，writeblanklines(n)写入n个空行
file.writeline "tomcat在" 
file.writeline now
file.writeline "自动重启了一次" 
file.writeblanklines 2 
file.close   
end if      
end if 
WScript.Sleep(20000)  

loop