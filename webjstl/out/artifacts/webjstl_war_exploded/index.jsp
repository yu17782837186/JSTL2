<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2019/11/17
  Time: 17:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
    jstl认识：
    作用：提高再jsp页面中的逻辑代码的编写效率，使用标签
    使用：
    jstl的核心标签库
    jstl的格式化标签库
    jstl的sql标签库
    jstl的函数标签库
    jstl的xml标签库
    jstl的核心标签库：
    1，导入jar包
    2，声明jstl标签库的引入(核心标签库)
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    内容：<c:out value="数据" default="默认值"></c:out>
    数据可以实常量值也可以是el表达式 作用：将数据输出给客户端

    <c:set var="hello" value="hello pageContext" scope="page"></c:set>
    作用：存储数据到作用域对象中
    var:表示存储的键名
    value:表示存储的数据
    scope:表示要存储的作用域对象 page request session application

    <c:remove var="hello" scope="page"></c:remove>
    作用：删除作用域中的指定键的数据
    var:表示要删除的键的名字
    scope:表示要删除的的作用域
    注意：如果在不指定作用域的情况使用该标签删除数据，会将四个作用域对象中的符合要求的数据全部删除

    逻辑标签：
         <c:if test="${a > 3}">
            前端代码
         </c:if>
    作用：进行逻辑判断，相当于if
    注意：逻辑判断标签需要依赖于el的逻辑运算，也就是表达式中的数据必须从作用域中获取

    <c:choose>
    <c:when test="${score>=90}">
    执行内容
    </c:when>
    <c:otherwise>
    执行内容
    </c:otherwise>
    </c:choose>
    作用：用来进行多条件的逻辑判断，if else
    注意：条件成立只会执行一次，都不成立执行otherwhise

    循环标签：
    <c:forEach begin="1" end="4" step="2">
        循环体
    </c:forEach>
    作用：循环内容进行处理
    使用：begin:声明循环开始位置 end:声明循环结束位置 step:设置步长
    varStatus:声明变量记录每次循环的数据(角标，次数，是否是第一次循环，是否是最后一次循环)
    注意：数据存储在作用域中，需要使用el表达式来获取
            8888----${vs.index}----${vs.count}----${vs.first}----${vs.last}
    items:声明要遍历的对象，结合el表达式来获取对象
    var:声明变量记录每次循环的结果，存储在作用域中需要使用el表达式来获取
        <c:forEach items="${list}" var="str">
            ${str}<br>
        </c:forEach>
--%>
<%
    request.setAttribute("str","今天天气真好，适合学习");
%>
${str}
<!--基本标签-->
<h3>基本标签认识</h3>
<c:out value="哈哈哈"></c:out>
<c:out value="${str}" default="666666"></c:out>
<c:set var="hello" value="hello pageContext" scope="page"></c:set>
<c:set var="hello" value="hello request" scope="request"></c:set>
<c:set var="hello" value="hello session" scope="session"></c:set>
<c:set var="hello" value="hello application" scope="application"></c:set><br />
<c:out value="${hello}"></c:out> <br />
<c:out value="${requestScope.hello}"></c:out><br />
<c:out value="${sessionScope.hello}"></c:out><br />
<c:out value="${applicationScope.hello}"></c:out><br />
<c:remove var="hello" scope="page"></c:remove>
<c:out value="${hello}"></c:out>
<hr>
<!--逻辑标签-->
<h3>逻辑标签认识</h3>
<!--传统方式-->
<%
    int a = 4;
    if (a>3){

%>
<b>今天天气真好</b>
<% }%>
<br />
<!--jstl方式-->
<c:set var="a" value="4"></c:set>
<c:if test="${a > 3}">
    <b>今天适合学习</b>
</c:if>
<br />
<c:set var="score" value="95">
</c:set>
<c:choose>
    <c:when test="${score>=90}">
        <i>玩lol</i>
    </c:when>
    <c:when test="${score<90&&score>=80}">
        <i>休息两个小时</i>
    </c:when>
    <c:when test="${score < 80 && score >= 70}">
        <i>继续学习</i>
    </c:when>
    <c:when test="${score < 70}">
        <i>唱征服</i>
    </c:when>
    <c:otherwise>
        <i>没有休息时间</i>
    </c:otherwise>
</c:choose>
<hr>
<!--传统方式的表格-->
<table border="1px">
    <tr>
        <td>课程名称</td>
        <td>教师</td>
        <td>价格</td>
        <td>重要性</td>
    </tr>
    <%
        for (int i = 0; i < 3; i++) {
            if (i == 2){
    %>
    <tr>
        <td>java</td>
        <td>余浩</td>
        <td>66</td>
        <td>非常重要</td>
    </tr>
    <%}}%>
</table>
<br>
<%
    ArrayList<String> list = new ArrayList<>();
    list.add("a");
    list.add("b");
    list.add("c");
    list.add("d");
    request.setAttribute("list",list);
    HashMap<String,String> map = new HashMap<>();
    map.put("a1","哈哈哈");
    map.put("a2","嘿嘿嘿");
    request.setAttribute("map",map);
%>
<!--使用jstl方式完成循环-->
<!--常量循环-->
<c:forEach begin="0" end="4" step="1" varStatus="vs">
    8888----${vs.index}----${vs.count}----${vs.first}----${vs.last} <br>
</c:forEach>
<!--动态循环-->
<c:forEach items="${list}" var="str">
    ${str}<br>
</c:forEach>
<table border="1px">
    <tr>
        <td>课程名称</td>
        <td>教师</td>
        <td>价格</td>
        <td>重要性</td>
    </tr>
    <c:forEach items="${list}" var="s">
    <tr>
        <td>${s}</td>
        <td>${s}</td>
        <td>${s}</td>
        <td>${s}</td>
    </tr>
    </c:forEach>
</table>
<!--遍历map集合-->
<c:forEach items="${map}" var="m">
    ${m.key}---${m.value} <br>
</c:forEach>
