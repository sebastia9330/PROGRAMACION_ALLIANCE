/* DETECTION_STRATEGY = <%=odiRef.getOption ("DETECTION_STRATEGY")%> */
<%
   targetColsMappedFromSource = odiRef.getColList("", "T.[COL_NAME]", ",\n\t", "", "((UPD AND (NOT UK) AND (NOT TRG)) AND REW)");
   targetColsMappedOnTarget = odiRef.getColList(odiRef.getColList(",", " ", "", "", "((UPD AND (NOT UK) AND (NOT TRG)) AND REW)"), "T.[COL_NAME]", ",\n\t", "", "((UPD AND (NOT UK) AND TRG) AND REW)");
   if (targetColsMappedFromSource.trim().length() == 0 &&
       targetColsMappedOnTarget.trim().length() == 0)
       throw new OdiKMException( "More target column mappings needed: at least one target column, which is not part of the update key, must have a mapping expression assigned." );
%>update	<%=odiRef.getTable("L", "TARG_NAME", "A")%> T
set 	(
	<%=targetColsMappedFromSource%>
	<%=targetColsMappedOnTarget%>
	) =
		(
		select	<%=odiRef.getColList("", "S.[COL_NAME]", ",\n\t\t\t", "", "((UPD AND (NOT UK) AND (NOT TRG)) AND REW)")%>
			<%=odiRef.getColList(odiRef.getColList(",", " ", "", "", "((UPD AND (NOT UK) AND (NOT TRG)) AND REW)"), "[EXPRESSION]", ",\n\t\t\t", "", "((UPD AND (NOT UK) AND TRG) AND REW)")%>
		from	<%=odiRef.getTable("L", "INT_NAME", "W")%> S
		where	<%=odiRef.getColList("", "T.[COL_NAME]	=S.[COL_NAME]", "\n\t\tand\t", "", "UK")%>
	    	 )
<% /* for NONE strategy */ if ("NONE".equals( odiRef.getOption ("DETECTION_STRATEGY") )) { %>
where	exists (
		select 	'X'
		from	<%=odiRef.getTable("L", "INT_NAME", "W")%> T2
		where	<%=odiRef.getColList("", "T2.[COL_NAME]	=T.[COL_NAME]", "\n\t\t\tand\t", "", "UK")%>
	)

<% /* for all other strategies use IND_UPDATE from flow table */ } else { %>
where	(<%=odiRef.getColList("", "[COL_NAME]", ", ", "", "UK")%>)
	in	(
		select	<%=odiRef.getColList("", "[COL_NAME]", ",\n\t\t\t", "", "UK")%>
		from	<%=odiRef.getTable("L", "INT_NAME", "W")%>
		where	IND_UPDATE = 'U'
		)
<% }; %>