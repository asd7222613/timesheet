<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="row">

	<div class="col-xs-12">
		<div class="card">
			<div class="card-header">
				<div class="card-title">
					<div class="title">
						<small>新增工时信息</small>
					</div>
				</div>
			</div>
			<div class="card-body">
				<form class="form-horizontal">
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">项目</label>
						<div class="col-sm-10">
							<select class="form-control">
								<option>OA</option>
								<option>OST</option>
								<option>MCMS</option>
								<option>NAZA</option>
								<option>EMM</option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label for="" class="col-sm-2 control-label">任务类型</label>
						<div class="col-sm-10">
							<select class="form-control">
								<option>开发</option>
								<option>维护</option>
								<option>实施</option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label for="" class="col-sm-2 control-label">开发日期</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" />
						</div>
					</div>

					<div class="form-group">
						<label for="" class="col-sm-2 control-label">工作描述</label>
						<div class="col-sm-10">
							<textarea class="form-control" rows="3"></textarea>
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">提交</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>