

<t:personal_page>
    <jsp:attribute name="js">
        <script src="https://cdn.tiny.cloud/1/tqma32h5o4jgstj9c1lfgu7ap5gaygxnz1x7xsumn9l0ivcn/tinymce/5/tinymce.min.js"
                referrerpolicy="origin"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.2.5/js/locales/vi.min.js"></script>

        <script>
            tinymce.init({
                selector: '#fullDes',
                height: 300,
                plugins: 'lists link media autolink table image paste autosave',
                language: 'vi',
                menubar: false,
                toolbar: [
                'undo redo | bold italic underline strikethrough | numlist bullist | link autolink | table media | restoredraft| forecolor backcolor',
                ],
                entity_encoding :"raw",
            });

        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="max-w-7xl mx-auto">
            <form method="post" action="">
                <div class="card">
                    <h4 class="card-header">THÔNG TIN SẢN PHẨM</h4>
                    <div class="card-body">
                        <div class="form-group">
                            <label for="proName">Tên sản phẩm</label>
                            <input type="text" class="form-control" id="proName" name="ProductName">
                        </div>

                        <div class="form-group language-vn">
                            <label for="fullDes">Mô tả sản phẩm</label>
                            <textarea id="fullDes" name="FullDes"></textarea>
                        </div>
                    </div>
                    <div class="=card-footer">
                        <div class="">
                            <button type="submit" class="btn btn-primay">
                                <i class=" fa fa-check-square-o" aria-hidden="true"></i> SAVE
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </jsp:body>
</t:personal_page>

