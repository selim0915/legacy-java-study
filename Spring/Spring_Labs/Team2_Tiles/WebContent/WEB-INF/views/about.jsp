		<div id="fh5co-main">

			<div class="fh5co-narrow-content animate-box"
				data-animate-effect="fadeInLeft">

				<div class="row">
					<div class="col-md-4">
						<h2>Write</h2>
					</div>
				</div>
				<form action="${pageContext.request.contextPath}/blog.htm">
					<div class="row">
						<div class="row">
							<div class="col-md-10">
								<div class="form-group">
									<input type="text" class="form-control" placeholder="Title">
								</div>
								<div class="form-group">
									<textarea name="" id="message" class="form-control"
										placeholder="Text" style="resize: none; height: 600px;"></textarea>
								</div>

								<!-- 									<div class="form-group">
										<input type="text" class="form-control" placeholder="작성자">
									</div>
									<div class="form-group">
										<input type="text" class="form-control" placeholder="Phone">
									</div> -->
							</div>
							<!-- 								<div class="col-md-6">
									<div class="form-group">
										<textarea name="" id="message" cols="30" rows="7" class="form-control" placeholder="Message"></textarea>
									</div>
									<div class="form-group">
										<input type="submit" class="btn btn-primary btn-md" value="Send Message">
									</div>
								</div> -->
						</div>
					</div>
					<div class="row">
						<div class="col-md-10" align="right" >
							<div class="form-group">
								<input type="submit" class="btn btn-primary btn-md" value="Submit"
								style="border-radius:5px;">
							</div>

						</div>

					</div>
				</form>
			</div>

		</div>