package com.max.realm;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.max.domain.Menu;
import com.max.domain.Role;
import com.max.domain.User;
import com.max.repository.UserRepository;

@Component
public class UserRealm extends AuthorizingRealm{
	
	@Autowired
	private UserRepository userRepository;

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		String userName = (String)principals.fromRealm(getName()).iterator().next();
		User user = userRepository.findUser(userName);
		if(user != null) {
			 SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
			 for(Role role : user.getRoles()) {
				 info.addRole(role.getRoleName());
				 for(Menu menu : role.getMenus()) {
					 info.addStringPermission(menu.getPermissionCode());
				 }
			 }
			 
			 return info;
		}else {
			 return null;
		}
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
		UsernamePasswordToken token = (UsernamePasswordToken)authcToken;
		User user = userRepository.findUser(token.getPrincipal().toString());
		
		if(user != null) {
			//将当前用户保存到session中
			SecurityUtils.getSubject().getSession().setAttribute("currentUser", user);
			return new SimpleAuthenticationInfo(user.getUserAccount(), user.getUserPassword(), getName());
		}else {
			return null;
		}
		
	}

}
