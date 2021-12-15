<#import "parts/common.ftlh" as c>
<@c.page>

<div class="form-row">
    <div class="form-group col-md-6">
        <form method="get" action="/main" class="form-inline">
            <input class="form-control mr-1" type="text" name="filter" value="${filter?ifExists}" placeholder="Search by tag">
            <button class="btn btn-primary" type="submit">Search</button>
        </form>
    </div>
</div>
<#include "parts/messageEditor.ftlh" />
<#include "parts/messageList.ftlh" />
</@c.page>