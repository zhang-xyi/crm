<%--
  Created by IntelliJ IDEA.
  User: zhangyi
  Date: 2020/12/23
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    function showMsg(msg){
        $("#msg").text(msg)
        $("#tipModal").modal("show");
        window.setTimeout(function () {
            $("#tipModal").modal("hide");
        },2500)
    }
</script>
<%--提示信息的模态窗口--%>
<div class="modal fade" id="tipModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 30%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title">提示信息</h4>
            </div>
            <div class="modal-body">
                <div id="msg" style="text-align: center;font-size: 16px"></div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
            </div>
        </div>
    </div>
</div>