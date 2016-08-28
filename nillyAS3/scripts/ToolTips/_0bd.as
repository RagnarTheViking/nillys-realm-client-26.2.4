package ToolTips
{
   import _1gF_.SimpleText;
   import flash.text.TextFieldAutoSize;
   import _1xa._dU_;
   import flash.filters.DropShadowFilter;
   import _1xa._1eo;
   
   public class _0bd extends ToolTip
   {
       
      
      public var _7H_:SimpleText;
      
      public var tipText_:SimpleText;
      
      public function _0bd(param1:uint, param2:uint, param3:String, param4:String, param5:int, param6:Object = null)
      {
         super(param1,1,param2,1);
         if(param3 != null)
         {
            this._7H_ = new SimpleText().setSize(20).setColor(16777215);
            this._16H_(this._7H_,param5,param3);
         }
         if(param4 != null)
         {
            this.tipText_ = new SimpleText().setSize(14).setColor(11776947);
            this._16H_(this.tipText_,param5,param4,param6);
         }
      }
      
      override protected function alignUI() : void
      {
         this.tipText_.y = !!this._7H_?Number(this._7H_.height + 8):Number(0);
      }
      
      public function _16H_(param1:SimpleText, param2:int, param3:String, param4:Object = null) : void
      {
         param1.setAutoSize(TextFieldAutoSize.LEFT);
         param1.setWordWrap(true).setTextWidth(param2);
         param1.setStringBuilder(new _dU_().setParams(param3,param4));
         param1.filters = [new DropShadowFilter(0,0,0)];
         _01T_.push(param1.textChanged);
         addChild(param1);
      }
      
      public function setTitle(param1:_1eo) : void
      {
         this._7H_.setStringBuilder(param1);
         draw();
      }
      
      public function _0D_S_(param1:_1eo) : void
      {
         this.tipText_.setStringBuilder(param1);
         draw();
      }
   }
}
