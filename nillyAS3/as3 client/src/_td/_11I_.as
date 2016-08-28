package _td
{
   import com.company.assembleegameclient.parameters.Parameters;
   import flash.events.Event;
   import com.company.util.MoreColorUtil;
   import flash.geom.ColorTransform;
   import _1xa._1eo;
   
   public class _11I_ extends _011
   {
       
      
      private var callback_:Function;
      
      private var _1jT_:_td._1zv;
      
      public function _11I_(param1:String, param2:Vector.<_1eo>, param3:Array, param4:String, param5:String, param6:Function, param7:Number = 16777215)
      {
         super(param1,param4,param5);
         _Y___.setColor(param7);
         _1mG_.tipText_.setColor(param7);
         this.callback_ = param6;
         this._1jT_ = new _td._1zv(param2,param3,Parameters.data_[_bb],param7);
         this._1jT_.addEventListener(Event.CHANGE,this._1C___);
         addChild(this._1jT_);
      }
      
      override public function refresh() : void
      {
         this._1jT_.setValue(Parameters.data_[_bb]);
      }
      
      public function _01g() : void
      {
         this._1jT_.setValue(Parameters.data_[_bb],false);
      }
      
      private function _1C___(param1:Event) : void
      {
         Parameters.data_[_bb] = this._1jT_.value();
         if(this.callback_ != null)
         {
            this.callback_();
         }
         Parameters.save();
      }
      
      public function enable(param1:Boolean) : void
      {
         transform.colorTransform = !!param1?MoreColorUtil._J_J_:MoreColorUtil.identity;
         mouseEnabled = !param1;
         mouseChildren = !param1;
      }
   }
}
