/*
;************************************************************************************************************
;*									  	 ������ʢ�Ƽ����޹�˾
;*                                     	    ��    ��    ��
;*
;*                                 	    http://www.techshine.com
;*
;*--------------------------------------------- �ļ���Ϣ ----------------------------------------------------                                      
;*
;* �ļ����� : MAIN.c	
;* �ļ����� : Ӧ��������
;* ����˵�� : 
;*-------------------------------------------- ���°汾��Ϣ -------------------------------------------------
;* �޸����� : ARM����С��
;* �޸����� : 2004/00/00
;* �汾���� : V1.0.1
;*-------------------------------------------- ��ʷ�汾��Ϣ -------------------------------------------------
;* �ļ����� : ARM����С��
;* �������� : 2004/06/25
;* �汾���� : v1.0.0
;*-----------------------------------------------------------------------------------------------------------
;*-----------------------------------------------------------------------------------------------------------
;************************************************************************************************************
;*/

#include "..\inc\config.h"

/*
*************************************************************************************************************
- �������� : Main(void)
- ����˵�� : ϵͳ�����������
- ������� : ��
- ������� : ��
*************************************************************************************************************
*/
 
void Main()                            
{ 
 	char p;
 	Target_Init(); //Ŀ���ʼ��
  	while(1)
  	{	
 		switch(key_number)
 		{
 			case 0:
  				send_byte(cmd_test); 	//���Լ�
  				break;
            
            case 1:
                for(p=0;p<8;p++)         //����8λ
                {
            		send_byte(0xA0);
            		send_byte(0xC8+7);    
            		send_byte(p);
                    long_delay();
                    
                    Delay(1000);
                 }
       		    break;
  
  			case 2:
  				 
  				for(p=0;p<8;p++)         //ѭ������
                 {
            		send_byte(0xA0);
            		send_byte(0xC8+7);    
            		
            		send_byte(p);
                    long_delay();
                    
                    Delay(1000);
                 }
                for(;;)
                 {
                    if (key_number!=2)
                    {
                        break;
                    }
                    Delay(1000);
                    send_byte(0xA2);
                }
  				break;
  	
  			case 3:
  			  	write7279(decode1+5,key_number/16*8);
    	        write7279(decode1+4,key_number & 0x0f);
				break;
  			
  			case 4:
  			 	send_byte(cmd_reset);    //��λ��
  				break;
  	
  			case 5:
  			  	write7279(decode1+5,key_number/16*8);
    	        write7279(decode1+4,key_number & 0x0f);
  			    break;
  			
  			case 6:
  			  	write7279(decode1+5,key_number/16*8);
    	        write7279(decode1+4,key_number & 0x0f);
  				break;
  			
  			case 7:
  			  	write7279(decode1+5,key_number/16*8);
    	        write7279(decode1+4,key_number & 0x0f);
  				break;
  		
  			case 8:
  		  	    write7279(decode1+5,key_number/16*8);
    	        write7279(decode1+4,key_number & 0x0f);
  				break;
  			
  			case 9:
  		  	    for(p=0;p<8;p++)         //����
                {
            		send_byte(0xA1);
            		send_byte(0xC8);    
            		send_byte(p);
                    long_delay();
                    
                    Delay(1000);
                }
                break;
  			
  			case 10:
  			  	for(p=0;p<8;p++)         //����
                {
            		send_byte(0xA1);
            		send_byte(0xC8);    
            		send_byte(p);
                    long_delay();
                    
                    Delay(1000);
                }
                for(;;)
                {
                    if (key_number!=10)
                    {
                   		break;
                  	}
                    Delay(1000);
                    send_byte(0xA3);
                }
         		break;
  			
  			case 11:
  			  	write7279(decode1+5,key_number/16*8);
    	        write7279(decode1+4,key_number & 0x0f);
  				break;
  	
  			case 12:
  				write7279(decode1+5,key_number/16*8);
    	        write7279(decode1+4,key_number & 0x0f);
  				break;
  	
  			case 13:
  				write7279(decode1+5,key_number/16*8);
    	        write7279(decode1+4,key_number & 0x0f);
  				break;
  	
  			case 14:
  			  	write7279(decode1+5,key_number/16*8);
    	        write7279(decode1+4,key_number & 0x0f);
  				break;
  
  			case 15:
  			    write7279(decode1+5,key_number/16*8);
    	        write7279(decode1+4,key_number & 0x0f);
  				break;
		}
 		key_number = 0xff;
 		Delay(50);
	}
}
