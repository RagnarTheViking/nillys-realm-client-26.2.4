package _11G_
{
   import _1T_4._0es;
   import _12g._mJ_;
   import _1__8._19A_;
   import _W_Q_._3z;
   import _0E_n._1h1;
   
   public class _0T_R_
   {
       
      
      [Inject]
      public var _kU_:_0es;
      
      [Inject]
      public var domain:_mJ_;
      
      [Inject]
      public var _0G_2:_19A_;
      
      public function _0T_R_()
      {
         super();
      }
      
      public function execute() : void
      {
         if(this.domain._rs())
         {
            this._1P_K_();
         }
         else
         {
            this._0C_w();
         }
      }
      
      private function _1P_K_() : void
      {
         this._kU_.dispatch(new _3z());
      }
      
      private function _0C_w() : void
      {
         this._0G_2.debug("bad domain, deny");
         this._kU_.dispatch(new _1h1());
      }
   }
}
