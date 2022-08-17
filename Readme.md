1. Setup
$ pip install -r requirements.txt

2. Parallel Test Execution in Robot Framework
$ pabot --processes 2 --outputdir Report Testcases\*

3. Run by bat file
3.1 Change the path in run.bat to be suitable with your env
$ run.bat

4. Run with headless Chrome
4.1 You have to download the latest Chrome Driver(and Chrome App)
4.2 Put the Chrome Driver on: C:\Users\phuch\AppData\Local\Programs\Python\Python310\Scripts(depending your env)
$ robot --outputdir Report Testcases\Test_Login_1.robot
or
$ pabot --processes 2 --outputdir Report Testcases\Test_Login_2.robot

5. Run Tests on Jenkins(CI Tool)
5.1 Install Java
5.2 Download Jenkins
(Ref: (https://www.simplilearn.com/tutorials/jenkins-tutorial/jenkins-installation-on-windows))
5.3 Create Project & Build
Ref: https://www.youtube.com/watch?v=AYTvoRaNjZ8&list=PLUDwpEzHYYLsCHiiihnwl3L0xPspL7BPG&index=27
