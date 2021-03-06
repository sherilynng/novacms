<section class="content-header">
    <h1>Create Sidebar</h1>
    <ol class="breadcrumb">
        <li><a href='{{{  admin_url('dashboard') }}}'><i class="fa fa-dashboard"></i> Dashboard</a></li>
        <li><a href='{{{  admin_url('sidebars') }}}'><i class="fa fa-cubes"></i> Sidebars</a></li>
        <li>Create Sidebar</li>
    </ol>
</section>

<section class='content'>

<div class="box box-primary">
	<div class="box-header with-border">
        <h3 class="box-title">Create Sidebar</h3>
    </div>
    <div class="box-body">

		<form action='{{{ admin_url('sidebars') }}}' method='post'>
		<input type='hidden' name='csrfToken' value='{{{ $csrfToken }}}'>

		{{ Session::getMessages() }}

		<div class='row'>

			<div class='col-md-6'>

				<div class="control-group">
				    <label class="control-label" for='title'> Title</label>
				    <input class="form-control" id='title' type="text" name="title" value="{{{ Input::old('title') }}}" />
				</div>

				<div class="control-group">
				    <label class="control-label" for='displayTitle'> Display Title</label>
				    <input id='displayTitle' type="checkbox" name="displayTitle" {{ (Input::old('displayTitle') == 'on' ? 'checked=checked' : '') }}" />
				</div>

				<div class="control-group">
				    <label class="control-label" for='class'> Class (optional classes comma seperated)</label>
				    <input class="form-control" id='class' type="text" name="class" value="{{{ Input::old('class') }}}" />
				</div>

			</div>

			<div class='col-md-6'>

				<div class="control-group">
				    <label class="control-label" for='position'> Position</label><br>

				    @php
				    $options = ['Left', 'Right'];
				    $position = Input::old('position');

				    if (is_array($position)) {
				    	$position = implode(',', $position);
				    }

				    foreach ($options as $option) {
				    	if (str_contains($position, $option)) {
				    		$check = 'checked=checked';
				    	} else {
				    		$check = null;
				    	}
				    	echo "<input type='checkbox' name='position[]' value='$option' $check> $option<br>";
				    }
				    @endphp
				</div>

			</div>

		</div>

		<div class="control-group">
		    <label class="control-label" for='content'> Content</label>
		    <textarea class="form-control ckeditor" id='content' name="content" rows='10'>{{ Input::old('content') }}</textarea>
		</div>

		<p><br>
		    <button type="submit" class="btn btn-success" name="submit"><i class="fa fa-check"></i> Submit</button>
		</p>

		</form>

    </div>
</div>


</section>
