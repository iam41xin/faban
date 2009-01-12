<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--
/* The contents of this file are subject to the terms
 * of the Common Development and Distribution License
 * (the License). You may not use this file except in
 * compliance with the License.
 *
 * You can obtain a copy of the License at
 * http://www.sun.com/cddl/cddl.html or
 * install_dir/legal/LICENSE
 * See the License for the specific language governing
 * permission and limitations under the License.
 *
 * When distributing Covered Code, include this CDDL
 * Header Notice in each file and include the License file
 * at install_dir/legal/LICENSE.
 * If applicable, add the following below the CDDL Header,
 * with the fields enclosed by brackets [] replaced by
 * your own identifying information:
 * "Portions Copyrighted [year] [name of copyright owner]"
 *
 * Copyright 2005 Sun Microsystems Inc. All Rights Reserved
 */
-->
<%@ page language="java" import="com.sun.faban.harness.common.BenchmarkDescription,
                                 com.sun.faban.harness.common.Config"%>
<jsp:useBean id="usrEnv" scope="session" class="com.sun.faban.harness.webclient.UserEnv"/>
<html>
    <head>
        <title></title>
        <link rel="icon" type="image/gif" href="img/faban.gif">
    </head>
    <body>
        <div style="text-align: right; font-size: small;">
<% if (Config.SECURITY_ENABLED) {

        String user = usrEnv.getUser();
        if (user == null) {
%>
        <a href="login.jsp" target="main">Login</a>
<%
        } else {
%>
        Logged in: <%= user %> |
        <a href="login.jsp?logout" target="main">Logout</a>
<%

        }
    }
%>
        </div>
    </body>
</html>