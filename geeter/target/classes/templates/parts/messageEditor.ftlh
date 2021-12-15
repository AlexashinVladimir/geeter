<a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Message editor
</a>
<div class="collapse" id="collapseExample">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input class="form-control" type="text" name="text"
                       value="<#if message??>${message.text}</#if>"
                       placeholder="Введите сообщение"/>
            </div>
            <div class="form-group">
                <input class="form-control" type="text" name="tag"
                       value="<#if message??>${message.tag}</#if>"
                       placeholder="Тег"/>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file" id="customFile">
                    <label class="custom-file-label" for="customFile">Choose file</label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <input type="hidden" name="id" value="<#if message??>${message.id}</#if>" />
            <button class="btn btn-primary" type="submit">Save</button>
        </form>
    </div>
</div>