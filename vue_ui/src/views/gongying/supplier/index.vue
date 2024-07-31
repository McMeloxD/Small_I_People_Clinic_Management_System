<template>
  <div>
    <el-form :inline="true" :model="keyword" class="demo-form-inline">
      <el-form-item>
        <el-input v-model="keyword.supplierName" placeholder="供应商名称" style="width: 250px" clearable></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="search" icon="el-icon-search">查询</el-button>
        <el-button type="success" @click="handleAdd" icon="el-icon-plus">添加</el-button>
        <el-button @click="dialoExcelVisible = true" icon="el-icon-top">导入</el-button>
        <el-button @click="downloadExcel" icon="el-icon-bottom">导出</el-button>
        <el-button type="danger" @click="handleDeletes" icon="el-icon-delete">批量删除</el-button>
      </el-form-item>
    </el-form>


    <!--上传excel的对话框-->
    <el-dialog title="上传供应商管理Excel" :visible.sync="dialoExcelVisible" width="26%">
      <el-upload
        class="upload-demo"
        drag
        action="http://localhost:9999/supplier/upload/excel"
        accept=".xlsx,.xls"
        :on-success="uploadExcelSuccess"
        :on-error="uploadExcelError"
        multiple>
        <i class="el-icon-upload"></i>
        <div class="el-upload__text">将文件拖入此处，或<em>点击上传</em></div>
        <div class="el-upload__tip" slot="tip">只能上传.xlsx,.xls文件，且不超过500kb</div>
      </el-upload>
    </el-dialog>

    <!--表格内容-->
    <el-table :data="tableData" style="width: 100%" @selection-change="handleSelectionChange">
      <el-table-column type="selection" align="center" width="30px"></el-table-column>
      <el-table-column align="center" prop="supplierId" label="序号" width="80"></el-table-column>
      <el-table-column align="center" prop="supplierNumber" label="供应商编号" width="140"></el-table-column>
      <el-table-column align="center" prop="supplierName" label="供应商名称" width="160"></el-table-column>
      <el-table-column align="center" prop="contacts" label="联系人" width="140"></el-table-column>
      <el-table-column align="center" prop="phone" label="联系电话" width="190"></el-table-column>
      <el-table-column align="center" prop="createTime" label="创建时间" width="190"></el-table-column>
      <el-table-column align="center" prop="supplierUser" label="创建人员"></el-table-column>
      <el-table-column align="center" prop="supplierState" label="供应状态">
        <template slot-scope="scope">
          <el-tag :type="scope.row.supplierState == 1 ? 'success' : 'danger'">
            <span v-if="scope.row.supplierState == 1">启用</span>
            <span v-else-if="scope.row.supplierState == 2">禁用</span>
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column align="center" label="操作">
        <template slot-scope="scope">
          <el-button type="text" size="mini" @click="handleClick(scope.row,'修改')">编辑</el-button>
          <el-button size="mini" type="text" @click="handleDelete(scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!--分页-->
    <el-card class="box-card">
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="currentPage"
        :page-sizes="[5,10,20]"
        :page-size="100"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total">
      </el-pagination>
    </el-card>




    <!--编辑/添加-->
    <el-dialog :title=title :visible.sync="dialogFormVisible" width="650px">
      <el-form ref="supplier" :inline="true" :model="supplier" :rules="rules" class="demo-form-inline">
        <el-form-item label="供应商名称" prop="supplierName">
          <el-input v-model="supplier.supplierName"style="width: 220px"></el-input>
        </el-form-item>
        <el-form-item label="联系人" prop="contacts">
          <el-input v-model="supplier.contacts"></el-input>
        </el-form-item>
        <el-form-item label="联系电话" prop="phone">
          <el-input v-model="supplier.phone"style="width: 220px"></el-input>
        </el-form-item>
        <el-form-item label="创建人员" prop="supplierUser">
          <el-input v-model="supplier.supplierUser"></el-input>
        </el-form-item>
        <el-form-item label="供应商状态" prop="supplierState">
          <el-radio-group v-model="supplier.supplierState">
            <el-radio :label = 1>启用</el-radio>
            <el-radio :label = 2>禁用</el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="quxiao('supplier')">取 消</el-button>
        <el-button type="primary" @click="addItemTyp('supplier')">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {getsupplier,delById,update,delByIds,getAdd,uploadPicture} from "@/api/supplier";
export default {
  data() {
    return {
      title:'修改',
      //编辑，回显数据
      supplier:{
        supplierName:'',
        contacts:'',
        phone:'',
        supplierUser:'',
        supplierState:''
      },
      dialogFormVisible:false,
      dialoExcelVisible:false,
      //搜索关键字
      keyword:{
        supplierName:'',
      },
      tableData: [],
      pageNum:1,
      pageSize:5,
      currentPage:1,
      total:0,
      //存储多选id
      supplierList:[],
      multipleSelection:[],
      //表单校验
      rules: {
        supplierName: [
          { required: true, message: '请填写供应商名称', trigger: 'blur' },
        ],
        contacts: [
          { required: true, message: '请填写联系人', trigger: 'blur' },
        ],
        phone: [
          { required: true, message: '请填写联系方式', trigger: 'blur' },
        ],
        supplierUser: [
          { required: true, message: '请填写创建人员', trigger: 'blur' },
        ],
        supplierState: [
          { required: true, message: '请选择供应商状态', trigger: 'blur' },
        ],
      }
    }
  },
  methods:{
    //导出
    downloadExcel() {
      this.$confirm('是否确认要导出Excel表格吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
      window.location.href = "http://localhost:9999/supplier/download/excel"
        this.$message({
          type: 'success',
          message: '导出成功',
          duration: 1000
        });
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '导出失败',
          duration: 1000
        });
      });
    },
    //导入
    uploadExcelError() {
      this.$message({
        type:"error",
        message:"上传失败"
      })
    },
    //导入
    uploadExcelSuccess() {
      this.$message({
        type:"success",
        message:"上传成功"
      })
      this.dialoExcelVisible = false;
      this.fetchData()
    },
    // 添加
    handleAdd() {
      this.title = "添加"
      this.dialogFormVisible = true
    },
    //批量删除
    handleDeletes() {
      if (this.supplierList.length == 0) {
        this.$message({
          type: 'info',
          message: '请选择您要删除的数据!',
          duration: 1000
        });
      } else {
        this.$confirm('是否确认删除"['+this.supplierList+']"的信息吗？', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          const isString = this.supplierList.join(",")
          delByIds(isString).then(res => {
            if (res.code == 20000) {
              this.$message({
                type: 'success',
                message: '删除成功!',
                duration: 1000
              });
              this.fetchData();
            }
          })
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消删除',
            duration: 1000
          });
        });
      }
    },
    //多选框
    handleSelectionChange(val) {
      this.supplierList = []
      this.multipleSelection = val
      for (let i = 0;i < this.multipleSelection.length;i++) {
        let user = this.multipleSelection[i]
        this.supplierList.push(user.supplierNumber)
      }
      console.log("999",this.supplierList)
    },
    //取消
    quxiao(formName) {
      //重置清空
      this.supplier = []
      this.$refs[formName].resetFields();
      this.fetchData();
      this.dialogFormVisible = false
    },
    //修改/添加
    addItemTyp(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          if (this.title == "修改") {
            update(this.supplier).then(res => {
              if (res.code == 20000) {
                this.$message({
                  type: 'success',
                  message: '修改成功!',
                  duration: 1000
                });
                this.fetchData();
                //重置清空
                this.supplier = []
                this.$refs[formName].resetFields();
              }
            })
          } else {
            getAdd(this.supplier).then(res => {
              console.log(this.supplier)
              if (res.code == 20000) {
                this.$message({
                  type: 'success',
                  message: '添加成功!',
                  duration: 1000
                });
                this.fetchData();
                //重置清空
                this.supplier = []
                this.$refs[formName].resetFields();
              }
            })
          }
          this.dialogFormVisible = false
        }
      });
    },
    //编辑
    handleClick(row,title) {
      this.title = title
      this.dialogFormVisible = true
      this.supplier = row
    },
    //删除
    handleDelete(row) {
      this.$confirm('是否确认删除"'+row.supplierNumber+'"的信息吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        console.log("1111111111",row)
        let params = {
          id:row.supplierNumber
        }
        delById(params).then(res => {
          if (res.code == 20000) {
            this.$message({
              type: 'success',
              message: '删除成功!',
              duration: 1000
            });
            this.fetchData();
          }
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除',
          duration: 1000
        });
      });
    },
    //查询
    search() {
      this.fetchData()
    },
    fetchData(){
      let params = {
        pageNum:this.pageNum,
        pageSize:this.pageSize,
        supplierName:this.keyword.supplierName
      }
      getsupplier(params).then(res => {
        let pageInfo = res.data;
        this.tableData = pageInfo.list;
        this.total = pageInfo.total;
      })
    },
    //页面大小改变时触发
    handleSizeChange(val) {
      this.pageSize = val
      this.fetchData()
    },
    //当前页码改变时触发
    handleCurrentChange(val) {
      this.pageNum = val;
      this.fetchData()
    }
  },
  // 生命周期钩子函数(vue对象创建完,自动调用该方法)
  created() {
    this.fetchData()
  },
}
</script>

<style scoped lang="scss">

</style>
