<%@page contentType="text/html;charset=gb2312"%>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=gb2312"/>
	<title>�����, ʵ�ֺ�̨��ˢ�¸���ҳ��. �첽��</title>
</head>
<!-- ����Ƿ����, ����������У��, ��Ȼ�����������ݱ����. ���ʵ����ҳ����߼����� -->
<%
	//1. ���ܴ��ݹ����Ĳ���
	String id = request.getParameter("id");
	String name = request.getParameter("name");

	System.out.println("id="+id+",name="+name);

	//2. ���ݼ��(�ں�̨�����ݽ��м��)
	if(id==null || id.trim().length()==0)
	{
		out.println("Id can't be null or empty!");
	}else
		if(id!=null&&id.equals("nenu.edu")){
			out.println("id has been registered!");
	}else{
		out.println("everything is OK!");
	}
%>