package _0C_2
{
   import _0pN_._049;
   import _0R_R_._0M_7;
   import flash.display.LoaderInfo;
   import _0u4._0us;
   import _0E_n._jE_;
   import _3b.DialogSignal;
   import _3b.CloseDialogsSignal;
   import flash.system.Security;
   import flash.display.DisplayObject;
   
   public class _V_F_ extends _049 implements _0M_7
   {
       
      
      [Inject]
      public var info:LoaderInfo;
      
      [Inject]
      public var _1iN_:_0us;
      
      [Inject]
      public var local:_0C_2._17f;
      
      [Inject]
      public var _H_u:_jE_;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var _0dR_:CloseDialogsSignal;
      
      public function _V_F_()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         var _loc1_:String = this.info.parameters.kongregate_api_path;
         Security.allowDomain(_loc1_);
         this._H_u._1iN_.addChild(this._1iN_ as DisplayObject);
         this._1iN_._1K_O_.addOnce(this._0wd);
         this._1iN_.load(_loc1_);
      }
      
      private function _0wd() : void
      {
         _0et(true);
      }
   }
}
