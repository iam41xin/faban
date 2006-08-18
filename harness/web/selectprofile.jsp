<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
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
 * $Id: selectprofile.jsp,v 1.2 2006/08/17 23:22:45 akara Exp $
 *
 * Copyright 2005 Sun Microsystems Inc. All Rights Reserved
 */
-->
<html>
<head>
<link rel="icon" type="image/gif" href="img/faban.gif">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
<meta name="Author" content="Ramesh Ramachandran"/>
<meta name="Description" content="Form to display profile selection"/>
<%@ page language="java" import="com.sun.faban.harness.webclient.UserEnv,
                                 com.sun.faban.harness.common.BenchmarkDescription,
                                 java.util.Map"%>

<jsp:useBean id="usrEnv" scope="session" class="com.sun.faban.harness.webclient.UserEnv"/>
<%
    String profile = (String)session.getAttribute("faban.profile");
    BenchmarkDescription desc =  (BenchmarkDescription) session.getAttribute(
            "faban.benchmark");
    String benchmark = desc == null ? null : desc.name;

    if((profile != null) && (benchmark != null)) {
%>
<meta HTTP-EQUIV=REFRESH CONTENT="0;URL=new-run.jsp">
<%
    }
    else {
        String[] profiles = usrEnv.getProfiles();
        Map<String, BenchmarkDescription> benchNameMap =
                BenchmarkDescription.getBenchNameMap();
        int benchCount = benchNameMap.size();
        if (benchCount < 1) {
%>
</head>
<body>
<h3><center>Sorry, Faban could not find or successfully deploy any benchmarks.</center></h3>

<%
        } else {
            String[] benchmarks = new String[benchCount];
            benchmarks = benchNameMap.keySet().toArray(benchmarks);
%>


<script>
function updateProfile() {
    document.bench.profile.value=document.bench.profilelist.value
}
</script>

</head>
<body>
<br/>
<br/>
<br/>

<form name="bench" method="post" action="new-run.jsp">
  <table cellpadding="0" cellspacing="2" border="0" align="center">
    <tbody>
      <tr>
        <td>Profile</td>
        <td>
          <input type="text" name="profile" size="10"
            <% if(profile != null) { %>
              value= <%=profile %>
            <% }
               else {
                 if((profiles != null) && (profiles.length > 0)) {
            %>
              value= <%=profiles[0] %>
            <%   }
               }
            %>
          >
          <% if((profiles != null) && (profiles.length > 0)) { %>
            <select name="profilelist" ONCHANGE="updateProfile()">
              <% for(int i = 0; i < profiles.length; i++) { %>
                <option
                  <% if(((profile != null) && profiles[i].equals(profile)) ||
                        ((profile == null) && (i == 0))){ %>
                    SELECTED
                  <% } %>
                  ><%= profiles[i]%>
                </option>
              <% } %>
            </select>
          <% } %>
        </td>
      </tr>
      <% if (benchmark == null)
             benchmark = benchmarks[0];
         if (benchmarks.length > 1) { %>
        <tr>
          <td>Benchmark</td>
          <td>
            <select name="benchmark">
              <% for (int i = 0; i < benchmarks.length; i++) { %>
              <option
                  <% if(benchmarks[i].equals(benchmark)) { %>
                    SELECTED
                  <% } %>
                  ><%= benchmarks[i]%>
              <% } %>
            </select>
          </td>
        </tr>
      <% } %>
    </tbody>
  </table>
  <% if (benchmarks.length == 1) { %>
      <input type="hidden" name="benchmark" value="<%=benchmark %>"></input>
  <% } %>
  <br>
  <br>
  <center><input type="submit" value="Select">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset"></center>
</form>

<%          }
        }
%>

</body>
</html>