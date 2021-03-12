/*
;************************************************************************************************************
;*				        				�������Ǵ�ʢ�Ƽ����޹�˾
;*                                     	     ��    ��    ��
;*
;*                                 	     http://www.techshine.com
;*
;*--------------------------------------------- �ļ���Ϣ ----------------------------------------------------                                      
;*
;* �ļ����� : keydriver.h	
;* �ļ����� : ���ļ�ΪS3C44B0Ӳ��ƽ̨�ļ��̳���������ļ���
;* ����˵�� : 
;*-------------------------------------------- ���°汾��Ϣ -------------------------------------------------
;* �޸����� : ARM����С��
;* �޸����� : 2004/04/25
;* �汾���� : V1.0.1
;*-------------------------------------------- ��ʷ�汾��Ϣ -------------------------------------------------
;* �ļ����� : ARM����С��
;* �������� : 2004/04/20
;* �汾���� : v1.0.0
;*-----------------------------------------------------------------------------------------------------------
;*-----------------------------------------------------------------------------------------------------------
;************************************************************************************************************
;*/
#include  "..\startup44b0\inc\44b.h"
#include  <stdio.h>
#include  <math.h>
#define  ARMII 1

/********************************** �͸�HD7279ָ�� *************************************/

#define  cmd_reset 0xa4
#define  cmd_test  0xbf
#define  cmd_read  0x15
#define  decode1   0xc8

#define clr     (*(volatile unsigned *)0x04800000) = 0x01;
#define set     (*(volatile unsigned *)0x04800000) = 0x02;
extern unsigned char key_number;

/********************************** �������� ********************************************/

void          long_delay   (void);
void          short_delay  (void);
void          write7279    (unsigned char,unsigned char);
unsigned char read7279     (unsigned char);
void          send_byte    (unsigned char);
unsigned char receive_byte (void);
void          KeyINT_Init  (void);													            
void          __irq Key_ISR(void);

extern void   Uart_Printf  (char port,char *fmt,...);

/******************************** 7279ʱ��ģ���ź� ***************************************/

#if ARMII
	#define clrcs1     (*(volatile unsigned *)0x08200004) = 0x01;
	#define setcs1     (*(volatile unsigned *)0x08200004) = 0x02;

	#define clrclk     rPDATF = rPDATF & (~(0x1<<8)) 	//GPF8
	#define setclk     rPDATF = rPDATF | (0x1<<8)

	#define clrdat     rPDATF = rPDATF & (~(0x1<<5))	//GPF5
	#define setdat     rPDATF = rPDATF | (0x1<<5)
#else	 
	#define clrcs1     rPDATA = rPDATA & (~(0x1<<8)) //GPA8
	#define setcs1     rPDATA = rPDATA | (0x1<<8)
	#define clrclk     rPDATC = rPDATC & (~(0x1<<8)) //GPC8
	#define setclk     rPDATC = rPDATC | (0x1<<8)
	#define clrdat     rPDATE = rPDATE & (~(0x1<<7))//GPE7
	#define setdat     rPDATE = rPDATE | (0x1<<7) 
#endif
 



/*
*************************************************************************************************************
*-													�����ļ�                                               -*
*************************************************************************************************************
*/






          
