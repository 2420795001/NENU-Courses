<%@page contentType="text/html;charset=gb2312"%>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=gb2312"/>
	<title>�ͻ���, ʵ�ֺ�̨��ˢ�¸���ҳ��. �첽��</title>
</head>
<!-- ����ǿͻ���, ��IE������� -->
<script type="text/javascript">
	//��Сд���е�
	var req = null;

	function test()
	{
		//ȡ�õ�ǰҳ���һЩ����
		var id = document.all("id").value;
		var name = document.all("name").value;

		//1. ��ʼ��XMLHttpRequest����
		req = new ActiveXObject("Microsoft.XMLHTTP");//IE�µ�.
		//2.  ���ö��������
		req.onreadystatechange = myDeal;//ָ���ص�����(Ajaxִ�������õķ���)
		//3. ��������. 
		req.open("GET","server.jsp?id="+id+"&name="+name,"false");//�������ĵ��Ļ�, ��GET�͹���, ����ҪPOST.
		req.send(null);

	}

	//���������˺�ִ�еĻص�����. ʵ����ˢ�¸���ҳ��
	function myDeal()
	{
		if(req.readyState==4)
		{
			//1.  ���ܷ���˷��ص�����
			var ret = req.responseText;	//���������������ı�
			//2. ����( �ⲿ���������ݾ���Ajax�޹��� )
			document.all("myDiv").innerHTML = ret; //�����������صĽṹ��ӵ���ҳ
		}
	}
</script>

<!--onblurʧȥ����ʱ����-->
id: <input type="text" name="id" onblur="test();"/>*<div id="myDiv" name="myDiv"></div><br/>
name:<input type="text" name="name"/><br/>
<!--onclick���ʱ����-->
<input type="button" value="register"/>