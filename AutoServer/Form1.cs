using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
namespace AutoServer
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            this.label1.Text = DateTime.Now.ToString(); 
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            Timer timer1 = new Timer();
            timer1.Interval = 100000;
            timer1.Enabled = true;
            timer1.Tick += new EventHandler(timer1EventProcessor);//添加事件


            Timer timer2 = new Timer();
            timer2.Interval = 100000;
            timer2.Enabled = true;
            timer2.Tick += new EventHandler(timer2EventProcessor);//添加事件
        }
        public void timer1EventProcessor(object source, EventArgs e)
        {
            this.label1.Text = DateTime.Now.ToString() + "http://116.62.124.214";

            if (DateTime.Now.Hour == 23 && DateTime.Now.Minute == 50 && DateTime.Now.Second == 50)
            {
                System.Diagnostics.Process.Start("explorer.exe", "http://116.62.124.214/autohtml.aspx");  
            }

            if (DateTime.Now.Hour == 23 && DateTime.Now.Minute == 55 && DateTime.Now.Second == 50)
            {
                foreach (System.Diagnostics.Process p in System.Diagnostics.Process.GetProcessesByName("chrome"))
                {
                    p.Kill();
                }
            }
        }

        /// <summary>
        /// 未处理的资讯队列重新分配
        /// </summary>
        /// <param name="source"></param>
        /// <param name="e"></param>
        public void timer2EventProcessor(object source, EventArgs e)
        {
            try
            {
                this.label2.Text = DateTime.Now.ToString() + "http://116.62.124.214"; 

                if (DateTime.Now.Hour > 8 && DateTime.Now.Hour <= 22)
                {
                    System.Diagnostics.Process.Start("explorer.exe", "http://116.62.124.214/auto.aspx");

                    foreach (System.Diagnostics.Process p in System.Diagnostics.Process.GetProcessesByName("chrome"))
                    {
                        p.Kill();
                    }
                }
            }
            catch (Exception ex)
            {
 
            }
        }


        private void timer2_Tick(object sender, EventArgs e)
        {
            this.label2.Text = DateTime.Now.ToString(); 
        }

　　
    }
}
