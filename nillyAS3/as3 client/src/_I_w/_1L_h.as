package _I_w
{
   import _1__8._19A_;
   import _1__8._0dX_;
   import flash.utils.getTimer;
   
   public class _1L_h implements _19A_
   {
       
      
      private var _8O_:Object;
      
      private var _0tA_:_0dX_;
      
      public function _1L_h(param1:Object, param2:_0dX_)
      {
         super();
         this._8O_ = param1;
         this._0tA_ = param2;
      }
      
      public function debug(param1:*, param2:Array = null) : void
      {
         this._0tA_.log(this._8O_,32,getTimer(),param1,param2);
      }
      
      public function info(param1:*, param2:Array = null) : void
      {
         this._0tA_.log(this._8O_,16,getTimer(),param1,param2);
      }
      
      public function _0G_b(param1:*, param2:Array = null) : void
      {
         this._0tA_.log(this._8O_,8,getTimer(),param1,param2);
      }
      
      public function error(param1:*, param2:Array = null) : void
      {
         this._0tA_.log(this._8O_,4,getTimer(),param1,param2);
      }
      
      public function _1F_e(param1:*, param2:Array = null) : void
      {
         this._0tA_.log(this._8O_,2,getTimer(),param1,param2);
      }
   }
}
