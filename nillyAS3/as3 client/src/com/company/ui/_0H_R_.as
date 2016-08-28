package com.company.ui
{
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.events.Event;
   import flash.text.TextLineMetrics;
   import flash.text.Font;
   import flash.text.TextFieldType;
   
   public class _0H_R_ extends TextField
   {
      
      public static const MyriadPro:Class = _0X_c;
       
      
      public var _13L_:int;
      
      public var _K_:int;
      
      public var _mA_:int;
      
      public var _1B_a:int;
      
      public function _0H_R_(param1:int, param2:uint, param3:Boolean = false, param4:int = 0, param5:int = 0)
      {
         super();
         this._13L_ = param4;
         if(this._13L_ != 0)
         {
            width = param4;
         }
         this._K_ = param5;
         if(this._K_ != 0)
         {
            height = param5;
         }
         Font.registerFont(MyriadPro);
         var _loc6_:Font = new MyriadPro();
         var _loc7_:TextFormat = this.defaultTextFormat;
         _loc7_.font = _loc6_.fontName;
         _loc7_.bold = false;
         _loc7_.size = param1;
         _loc7_.color = param2;
         defaultTextFormat = _loc7_;
         if(param3)
         {
            selectable = true;
            mouseEnabled = true;
            type = TextFieldType.INPUT;
            border = true;
            borderColor = param2;
            addEventListener(Event.CHANGE,this._1C___);
         }
         else
         {
            selectable = false;
            mouseEnabled = false;
         }
      }
      
      public function _J_(param1:String) : void
      {
         var _loc2_:TextFormat = defaultTextFormat;
         _loc2_.font = param1;
         defaultTextFormat = _loc2_;
      }
      
      public function setSize(param1:int) : void
      {
         var _loc2_:TextFormat = defaultTextFormat;
         _loc2_.size = param1;
         this._06U_(_loc2_);
      }
      
      public function setColor(param1:uint) : void
      {
         var _loc2_:TextFormat = defaultTextFormat;
         _loc2_.color = param1;
         this._06U_(_loc2_);
      }
      
      public function setBold(param1:Boolean) : void
      {
         var _loc2_:TextFormat = defaultTextFormat;
         _loc2_.bold = param1;
         this._06U_(_loc2_);
      }
      
      public function _3V_(param1:String) : void
      {
         var _loc2_:TextFormat = defaultTextFormat;
         _loc2_.align = param1;
         this._06U_(_loc2_);
      }
      
      public function setText(param1:String) : void
      {
         this.text = param1;
      }
      
      private function _06U_(param1:TextFormat) : void
      {
         setTextFormat(param1);
         defaultTextFormat = param1;
      }
      
      private function _1C___(param1:Event) : void
      {
         this.updateMetrics();
      }
      
      public function updateMetrics() : void
      {
         var _loc1_:TextLineMetrics = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         this._mA_ = 0;
         this._1B_a = 0;
         while(_loc4_ < numLines)
         {
            _loc1_ = getLineMetrics(_loc4_);
            _loc2_ = _loc1_.width + 4;
            _loc3_ = _loc1_.height + 4;
            if(_loc2_ > this._mA_)
            {
               this._mA_ = _loc2_;
            }
            this._1B_a = this._1B_a + _loc3_;
            _loc4_++;
         }
         width = this._13L_ == 0?Number(this._mA_):Number(this._13L_);
         height = this._K_ == 0?Number(this._1B_a):Number(this._K_);
      }
      
      public function _13s() : void
      {
         width = this._13L_ == 0?Number(textWidth + 4):Number(this._13L_);
         height = this._K_ == 0?Number(textHeight + 4):Number(this._K_);
      }
   }
}
