package com.max.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.format.annotation.DateTimeFormat;

import com.google.gson.annotations.Expose;

@Entity
@Table(name = "t_leave")
public class Leave implements Serializable {

	private static final long serialVersionUID = 6490036570845517277L;

	@Expose
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	@Expose
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")  
	@Column(name="starttime")
	private Date startTime;
	@Expose
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") 
	@Column(name="endtime")
	private Date endTime;
	@Expose
	@Column(name="reason")
	private String reason;
	@Column(name="isdelete")
	private int isDelete;
	@Column(name="createtime")
	private Date createTime;
	
	@ManyToOne
	@JoinColumn(name="userid")
	private User submitUser;
	
	@Transient
	private Task task;
	
	@Transient
	private HistoricProcessInstance historicProcessInstance;
	
	@Transient
	private ProcessDefinition processDefinition;
	
	@Transient
	private ProcessInstance processInstance;
	
	public Leave() {}

	public Leave(Long id, Date startTime, Date endTime, String reason, User submitUser, int isDelete, Date createTime) {
		this.id = id;
		this.startTime = startTime;
		this.endTime = endTime;
		this.reason = reason;
		this.submitUser = submitUser;
		this.isDelete = isDelete;
		this.createTime = createTime;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public User getSubmitUser() {
		return submitUser;
	}

	public void setSubmitUser(User submitUser) {
		this.submitUser = submitUser;
	}

	public int getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Task getTask() {
		return task;
	}

	public void setTask(Task task) {
		this.task = task;
	}

	public HistoricProcessInstance getHistoricProcessInstance() {
		return historicProcessInstance;
	}

	public void setHistoricProcessInstance(HistoricProcessInstance historicProcessInstance) {
		this.historicProcessInstance = historicProcessInstance;
	}

	public ProcessDefinition getProcessDefinition() {
		return processDefinition;
	}

	public void setProcessDefinition(ProcessDefinition processDefinition) {
		this.processDefinition = processDefinition;
	}

	public ProcessInstance getProcessInstance() {
		return processInstance;
	}

	public void setProcessInstance(ProcessInstance processInstance) {
		this.processInstance = processInstance;
	}

}
