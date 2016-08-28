package _C_
{
   import flash.text.TextFormat;
   import flash.text.TextField;
   import flash.text.Font;
   
   public class _0C_J_
   {
      
      public static const MyriadPro:Class = _2D_;
      
      public static const MyriadPro_Bold:Class = _P_w;
       
      
      private var _0K_d:_C_._1L_X_;
      
      public function _0C_J_()
      {
         super();
         Font.registerFont(MyriadPro);
         Font.registerFont(MyriadPro_Bold);
         var _loc1_:Font = new MyriadPro();
         this._0K_d = new _C_._1L_X_();
         this._0K_d.setName(_loc1_.fontName);
      }
      
      public function _7X_() : _C_._1L_X_
      {
         return this._0K_d;
      }
      
      public function apply(param1:TextField, param2:int, param3:uint, param4:Boolean, param5:Boolean = false) : TextFormat
      {
         var _loc6_:TextFormat = param1.defaultTextFormat;
         _loc6_.size = param2;
         _loc6_.color = param3;
         _loc6_.font = this._7X_().getName();
         _loc6_.bold = param4;
         if(param5)
         {
            _loc6_.align = "center";
         }
         param1.defaultTextFormat = _loc6_;
         param1.setTextFormat(_loc6_);
         return _loc6_;
      }
      
      public function _1dV_(param1:TextField, param2:int, param3:uint, param4:Boolean) : TextFormat
      {
         var _loc5_:TextFormat = param1.defaultTextFormat;
         _loc5_.size = param2;
         _loc5_.color = param3;
         _loc5_.font = this._7X_().getName();
         _loc5_.bold = param4;
         return _loc5_;
      }
   }
}
