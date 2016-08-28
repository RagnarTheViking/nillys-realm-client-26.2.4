package com.company.assembleegameclient.objects
{
   import _03U_._1U_N_;
   import _C_._0C_J_;
   import flash.display.BitmapData;
   import com.company.assembleegameclient.map.View;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import _0H_6.GameContext;
   
   public class Sign extends GameObject
   {
       
      
      private var _iB_:_1U_N_;
      
      private var _nJ_:_0C_J_;
      
      public function Sign(param1:XML)
      {
         super(param1);
         texture_ = null;
         this._iB_ = GameContext.getInjector().getInstance(_1U_N_);
         this._nJ_ = GameContext.getInjector().getInstance(_0C_J_);
      }
      
      override protected function getTexture(param1:View, param2:int) : BitmapData
      {
         if(texture_ != null)
         {
            return texture_;
         }
         var _loc3_:TextField = new TextField();
         _loc3_.multiline = true;
         _loc3_.wordWrap = false;
         _loc3_.autoSize = TextFieldAutoSize.LEFT;
         _loc3_.textColor = 16777215;
         _loc3_.embedFonts = true;
         var _loc4_:TextFormat = new TextFormat();
         _loc4_.align = TextFormatAlign.CENTER;
         _loc4_.font = this._nJ_._7X_().getName();
         _loc4_.size = 24;
         _loc4_.color = 16777215;
         _loc4_.bold = true;
         _loc3_.defaultTextFormat = _loc4_;
         var _loc5_:String = this._iB_.getValue(this._195(name_));
         _loc3_.text = _loc5_.split("|").join("\n");
         var _loc6_:BitmapData = new _1wr(_loc3_.width,_loc3_.height,true,0);
         _loc6_.draw(_loc3_);
         texture_ = TextureRedrawer.redraw(_loc6_,size_,false,0);
         return texture_;
      }
      
      private function _195(param1:String) : String
      {
         var _loc2_:Boolean = param1 != null && param1.charAt(0) == "{" && param1.charAt(param1.length - 1) == "}";
         return !!_loc2_?param1.substr(1,param1.length - 2):param1;
      }
   }
}
