<template>
  <div>
    <el-table :data="tableData" border style="width: 100%">
      <el-table-column align="center" prop="id" label="序号" width="100px"></el-table-column>
      <el-table-column align="center" prop="operateUser" label="操作人" width="150px">
        <template slot-scope="scope">
          <el-tag  :type="[scope.row.operateUser == 'lyx'?'':scope.row.operateUser == 'lb'?'info':scope.row.operateUser == 'wj'?'success':scope.row.operateUser == 'pw'?'warning':scope.row.operateUser == 'xk' ? 'danger':'danger']">
            <span>{{ scope.row.operateUser }}</span></el-tag>
        </template>
      </el-table-column>
      <el-table-column align="center" prop="operateName" label="执行的操作" width="250px">
        <template slot-scope="scope">
          <el-tag effect="plain" :type="scope.row.operateName.includes('查')?'success':''">
            <span>{{ scope.row.operateName }}</span></el-tag>
        </template>
      </el-table-column>
      <el-table-column align="center" prop="methodName" label="操作的方法" width="200px"></el-table-column>
      <el-table-column align="center" prop="operateTime" label="操作的时间" width="200px"></el-table-column>
      <el-table-column align="center" prop="result" label="操作的结果" width="100px">
        <template slot-scope="scope">
          <el-tag :type="scope.row.result == isTure?'success':'danger'">
            <span>{{ scope.row.result == '\"成功\"' ? '成功' : '失败' }}</span></el-tag>
        </template>
      </el-table-column>
      <el-table-column align="center" prop="costTime" label="操作耗时/s" width="100px">
        <template slot-scope="scope">
          <el-tag>
            <span>{{ scope.row.costTime }}</span></el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="danger" icon="el-icon-delete"
            @click="handleDelete(scope.row)"
          ></el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-card class="box-card">
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="currentPage"
        :page-sizes="[11,15,20]"
        :page-size="100"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total">
      </el-pagination>
    </el-card>
  </div>
</template>

<script>
import {getfindAll,delLog} from "@/api/log";
export default {
  data() {
    return {
      tableData: [],
      pageNum:1,
      pageSize:11,
      currentPage:1,
      total:0,
      isTure : '\"成功\"',
    }
  },
  methods:{
    fetchData(){
      let param = {
        pageSize:this.pageSize,
        pageNum:this.pageNum,
      }
      getfindAll(param).then(res => {
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
    },
    handleDelete(row){
      delLog(row.id).then(res=>{
        if (res.code == 20000){
          this.$message({
            type:'success',
            message:"日志删除成功",
            duration:1000
          })
        }
      })
      this.fetchData()
    },

  },
  // 生命周期钩子函数(vue对象创建完,自动调用该方法)
  created() {
    this.fetchData()
  },
}
</script>
