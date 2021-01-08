<div class="modal fade in" id="placePicker" role="dialog">
<div class="modal-dialog modal-lg" style="width: 90%;">
<div class="modal-content">
<div class="modal-header">
<h4 class="modal-title">Place Picker</h4>
<button type="button" class="close" data-dismiss="modal">×</button>
</div>
<div class="modal-body" style="padding: 0px;">
<div class="row">
<div class="col-md-12" style="padding: 10px;position: absolute;z-index: 1;background: #fff;width: 30%;margin-left: 20px;margin-top: 4px;box-shadow: 0 2px 4px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12)!important;">
<div class="input-group input-group-sm" style="width: 100%;"> 
<input type="text" class="form-control pull-right autocomplete" placeholder="Search here or pick a location on map" style="border: 1px solid #dddddd;" autocomplete="off">
</div>
<div class="address_content" style="display: none">
<div class="address" style="margin-top: 10px;display: block;padding: 9.5px;font-size: 13px;color: #333;background-color: #f5f5f5;border: 1px solid #ccc;border-radius: 4px;max-height: 50vh;overflow-x: hidden;overflow-y: scroll;text-align: left;">
</div>
<div class="row">
<div class="col-md-6">
<div class="btn btn-sm btn-default" style="width: 100%;margin-top: 10px;margin-bottom: 10px;" data-dismiss="modal">
<i class="fa fa-close"></i> Cancel
</div>
</div>
<div class="col-md-6">
<div class="btn btn-sm btn-success" id="placePickerSubmit" style="width: 100%;margin-top: 10px;margin-bottom: 10px;">
<i class="fa fa-check"></i> Select
</div>
</div>
</div>
</div>
</div>
<div class="col-md-12">
<div id="placePickerMap" style="height:calc( 80vh );width:100%"></div>
</div>
</div>
</div>
</div>
</div>
</div>
