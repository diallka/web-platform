
		<c:forEach items="${liste}" var="user">
			<ul>
				<li>
					<strong>${user.id}</strong> 
					${user.lastName} 
					${user.firstName} 
				</li>
			</ul>

		</c:forEach>
