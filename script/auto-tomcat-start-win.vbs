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
'file.writeline "����ǰ��status:" & http.Status

if   http.Status <> 200   Then  

'WshShell.Run("shutdown.bat")     

'WScript.Sleep(5000)          
WScript.Sleep(10000) 
WshShell.Run("startup.bat")  

if (fso.fileexists("D:\back-up-version\auto-start-up-log\log.txt")) then
'���ļ�������1Ϊforreading��2Ϊforwriting��8Ϊappending
set file=fso.opentextfile("D:\back-up-version\auto-start-up-log\log.txt",8,true)
file.writeline "tomcat��" 
file.writeline now
file.writeline "�Զ�������һ��:" & http.Status 
ts.writeblanklines 2 
file.close   
else
'�����ļ�������1Ϊforreading��2Ϊforwriting��8Ϊappending
set file=fso.createtextfile( "D:\back-up-version\auto-start-up-log\log.txt",2,ture)

'д���ļ����ݣ������ַ�����write(x)д��x���ַ���writelineд�뻻�У�writeblanklines(n)д��n������
file.writeline "tomcat��" 
file.writeline now
file.writeline "�Զ�������һ��" 
file.writeblanklines 2 
file.close   
end if      
end if 
WScript.Sleep(20000)  

loop