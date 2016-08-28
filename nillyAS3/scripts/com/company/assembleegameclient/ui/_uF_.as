package com.company.assembleegameclient.ui
{
   import flash.display.Sprite;
   import flash.display.IGraphicsData;
   import _1gF_.SimpleText;
   import flash.display.GraphicsSolidFill;
   import flash.display.GraphicsPath;
   import com.company.util.GraphicHelper;
   import flash.text.TextFieldAutoSize;
   
   public class _uF_ extends Sprite
   {
      
      protected static const _1n4:int = 4;
       
      
      protected var graphicsData_:Vector.<IGraphicsData>;
      
      public var _0yD_:int = 0;
      
      protected var text_:SimpleText;
      
      protected var w_:int;
      
      protected var _jv:GraphicsSolidFill;
      
      protected var _1xo:GraphicsSolidFill;
      
      protected var path_:GraphicsPath;
      
      public function _uF_(param1:int)
      {
         this._jv = new GraphicsSolidFill(16777215,1);
         this._1xo = new GraphicsSolidFill(8355711,1);
         this.path_ = new GraphicsPath(new Vector.<int>(),new Vector.<Number>());
         this.graphicsData_ = new <IGraphicsData>[this._jv,this.path_,GraphicHelper.END_FILL];
         super();
         this._0yD_ = param1;
      }
      
      protected function _0I_W_() : void
      {
         this.w_ = this._0yD_ != 0?int(this._0yD_):int(this.text_.width + 12);
         this.text_.x = this.w_ / 2;
         GraphicHelper.clearGraphicsPath(this.path_);
         GraphicHelper.drawUi(0,0,this.w_,this.text_.height + _1n4 * 2,4,[1,1,1,1],this.path_);
      }
      
      public function CreateText(param1:int) : void
      {
         this.text_ = this.makeText().setSize(param1).setColor(3552822);
         this.text_.setBold(true);
         this.text_.setAutoSize(TextFieldAutoSize.CENTER);
         this.text_.y = _1n4;
         addChild(this.text_);
      }
      
      protected function makeText() : SimpleText
      {
         return new SimpleText();
      }
   }
}
