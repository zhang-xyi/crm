<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--确认框的模态窗口--%>
<div class="modal fade" id="askModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 30%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title">请确认操作</h4>
            </div>
            <div class="modal-body">
                <p id="askModal-content"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" id="askModal-sure" class="btn btn-primary" data-dismiss="modal">确定</button>
            </div>
        </div>
    </div>
</div>
<script>
    function askModal(content,askCallBack) {
        $("#askModal-content").html(content)

        $("#askModal-sure").one("click",function () {
           askCallBack()
        })

        $("#askModal").modal("show")

    }
</script>
