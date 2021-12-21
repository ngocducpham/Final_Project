<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="categoriess" scope="request" type="java.util.List<com.final_project.beans.Category>" />

<t:admin>
    <jsp:attribute name="js" >
             <script>
                    let danhMucCap1 = [];
                    <c:forEach items="${categoriess}" var="c">
                        danhMucCap1.push(["${c.cat_ID}","${c.cname}"]);
                    </c:forEach>

                    let selectChonCap = document.getElementById('txtLevel');
                    let selectCap1;

                    selectChonCap.addEventListener('change',()=>{
                        if(selectChonCap.value == 2){
                            // tạo select, bỏ option vô select, bỏ select vô category1
                            selectCap1 = document.createElement('select');
                            selectCap1.setAttribute('name','Cparent_ID');
                            selectCap1.setAttribute('id','txtCatParentID');

                            for (let index = 0; index < danhMucCap1.length; index++) {
                                let option = document.createElement('option');
                                option.value = danhMucCap1[index][0];
                                option.innerText = danhMucCap1[index][1];

                                selectCap1.appendChild(option);
                            }

                            let cardBody = document.querySelector('.category1');
                            cardBody.appendChild(selectCap1);
                        }
                        else{
                            selectCap1.remove();
                        }
                    })
                </script>
        </jsp:attribute>
    <jsp:body>
        <form action="" method="post">
            <div class="card">
                <div class="card-header">
                    + Thêm danh mục
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <label for="txtCatName">Tên</label>
                        <input type="text" class="form-control" id="txtCatName" name="Cname" autofocus>
                    </div>
                </div>
                <div class="card-body">
                <label for="txtLevel">Cấp danh mục</label>
                <select name="Level" id="txtLevel">
                    <option value="1">Cấp 1</option>
                    <option value="2">Cấp 2</option>
                </select>
                </div>
                <div class="card-body category1">
                    <label for="txtCatParentID">Mặt hàng</label>

                </div>
                <div class="card-footer d-flex justify-between">
                    <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/Admin/Category/" role="button">
                        <i class="fa fa-backward" aria-hidden="true"></i>
                        List
                    </a>
                    <button type="submit" class="btn btn-success">
                        <i class="fa fa-check" aria-hidden="true"></i>
                        Save
                    </button>
                </div>
            </div>
        </form>
    </jsp:body>

</t:admin>
