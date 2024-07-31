<template>
  <div>
    <!-- 上方搜索框 -->
    <el-form :inline="true" :model="warehousingInfo" ref="searchForm" class="demo-form-inline">
      <el-form-item label="审核状态" prop="reviewStatus">
        <el-select v-model="warehousingInfo.reviewStatus" placeholder="全部">
          <el-option label="全部" :value="0"></el-option>
          <el-option label="审核通过" :value="1"></el-option>
          <el-option label="审核未通过" :value="2"></el-option>
          <el-option label="未审核" :value="3"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="入库类型" prop="type">
        <el-select v-model="warehousingInfo.type" placeholder="全部">
          <el-option label="全部" :value="0"></el-option>
          <el-option label="采购入库" :value="1"></el-option>
          <el-option label="退货入库" :value="2"></el-option>
          <el-option label="其他入库" :value="3"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item prop="searchQuery">
        <el-input v-model="warehousingInfo.searchQuery" style="width: 290px" placeholder="入库单号/供应商"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="search" size="medium">查询</el-button>
        <el-button type="primary" plain @click="resetSearchForm('searchForm')" icon="el-icon-refresh" size="medium">重置</el-button>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="handleAdd" icon="el-icon-circle-plus-outline" size="medium">新增入库</el-button>
      </el-form-item>
    </el-form>

    <!-- 中间表格信息 -->
    <el-table :data="warehousingList" style="width: 100%" height="600">
      <el-table-column fixed prop="id" label="序号" width="80"></el-table-column>
      <el-table-column prop="warehousingOrder" label="入库单号" width="140"></el-table-column>
      <el-table-column prop="supplierName" label="供应商名称" width="140"></el-table-column>
      <el-table-column prop="type" label="入库类型" width="100">
        <!-- 卡槽,判断 -->
        <template slot-scope="scope">
          <el-tag :type="scope.row.type == 1 ? 'success' : scope.row.type == 2 ? 'warning' : 'info'">
            <span>{{ scope.row.type == 1 ? '采购入库' : scope.row.type == 2 ? '退货入库' : '其他入库' }}</span>
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="makeName" label="制单人员" width="100"></el-table-column>
      <el-table-column prop="procurementAmount" label="采购金额" width="100"></el-table-column>
      <el-table-column prop="procurementRetail" label="零售金额" width="100"></el-table-column>
      <el-table-column prop="warehousingName" label="入库人员" width="100"></el-table-column>
      <el-table-column prop="createTime" label="创建时间" width="120"></el-table-column>
      <el-table-column prop="reviewStatus" label="审核状态" width="100">
        <!-- 卡槽,判断 -->
        <template slot-scope="scope">
          <el-tag :type="scope.row.reviewStatus == 1 ? 'success' : 'danger'">
            <span>{{ scope.row.reviewStatus == 1 ? '审核通过' : '审核未通过' }}</span>
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" width="140">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleAlter(scope.row)"
          >编辑</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="checkWarehousing(scope.row)"
          >查看</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDel(scope.row)"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

     分页组件
    <el-pagination
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
      :current-page="currentPage"
      :page-sizes="[5, 10, 20]"
      :page-size="pageSize"
      layout="total,sizes,prev,pager,next,jumper"
      :total="total"
    >
    </el-pagination>
  </div>
</template>

<script>
import {getList,delById} from '@/api/warehousing'


export default {
  name: "warehousing",

  data() {
    return {
      // 分页查询相关数据
      pageNum: 1,
      pageSize: 5,
      currentPage: 1,
      total: 0,
      warehousingList: [],
      warehousingInfo: {
        // 序号
        id: null,
        // 入库单号
        warehousingOrder: null,
        // 入库类型
        type: null,
        // 供应商名称
        supplierName: null,
        // 制单人员
        makeName: null,
        // 采购金额
        procurementAmount: null,
        // 零售金额
        procurementRetail: null,
        // 入库人员
        warehousingName: null,
        // 创建时间
        createTime: null,
        // 审核状态
        reviewStatus: null,
        // 搜索查询字段
        searchQuery: null
      }
    }
  },
  methods: {
    // 获取入库的数据 ,查询全部
    fetchData() {
      let params = {
        pageNum: this.pageNum,
        pageSize: this.pageSize,
        type: this.warehousingInfo.type,
        reviewStatus: this.warehousingInfo.reviewStatus,
        searchQuery: this.warehousingInfo.searchQuery
      }
      console.log("发出请求")
      getList(params).then(res => {
        console.log("或得的数据",res)
        // 获取入库信息列表
        this.warehousingList = res.data.list;
        this.warehousingInfo = res.data;
        console.log(this.warehousingList)
        let pageInfo = res.data;
        // 页面总数
        this.total = pageInfo.total;
      })
    },
    // 搜索框查询按钮查询 模糊查询
    search() {
      this.fetchData();
    },
    // 重置查询窗口
    resetSearchForm(formName) {
      this.$refs[formName].resetFields();
      this.fetchData()
    },
    // 修改编辑
    handleAlter(row) {
      this.$router.push({ path: '/editWarehousing', query: { ...row } })
    },
    // 添加
    handleAdd() {
      this.$router.push('/addWarehousing')
    },
    checkWarehousing(row){
      this.$router.push({path:'/checkWarehousing', query:{...row}})
    },
    // 删除
    handleDel(row) {
      // 提示框
      this.$confirm('是否确认删除入库单号为' + row.warehousingOrder + '的数据项？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        let params = {
          id: row.id
        }
        delById(params).then(res => {
          this.$message({
            type: 'success',
            message: '删除成功!'
          })
          this.fetchData();
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        });
      });
    },
    // 页面大小改变时触发
    handleSizeChange(val) {
      this.pageSize = val;
      this.fetchData();
    },
    // 页面改变时触发
    handleCurrentChange(val) {
      this.pageNum = val;
      this.fetchData();
    }
  },
  mounted() {
    this.fetchData()
  }
}
</script>

<style scoped>
.demo-form-inline {
  padding: 20px;
}
</style>
