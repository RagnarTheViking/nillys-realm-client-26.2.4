package _td
{
   import com.company.util.MoreColorUtil;
   import flash.geom.ColorTransform;
   import com.company.assembleegameclient.parameters.Parameters;
   import flash.events.Event;
   
   public class _1H_J_ extends _011
   {
       
      
      private var _0T_j:_td.KeyCodeBox;
      
      private var _0ew:Boolean;
      
      public function _1H_J_(param1:String, param2:String, param3:String, param4:Boolean = false)
      {
         super(param1,param2,param3);
         this._0T_j = new _td.KeyCodeBox(Parameters.data_[_bb]);
         this._0T_j.addEventListener(Event.CHANGE,this._1C___);
         addChild(this._0T_j);
         this._1X_u(param4);
      }
      
      public function _1X_u(param1:Boolean) : void
      {
         this._0ew = param1;
         transform.colorTransform = !!this._0ew?MoreColorUtil._J_J_:MoreColorUtil.identity;
         mouseEnabled = !this._0ew;
         mouseChildren = !this._0ew;
      }
      
      override public function refresh() : void
      {
         this._0T_j._E_8(Parameters.data_[_bb]);
      }
      
      private function _1C___(param1:Event) : void
      {
         Parameters.setKey(_bb,this._0T_j.value());
         Parameters.save();
      }
   }
}
