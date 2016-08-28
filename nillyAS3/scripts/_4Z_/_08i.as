package _4Z_
{
   import flash.display.Sprite;
   import flash.display.Shape;
   import _1gF_.SimpleText;
   import _1xa._dU_;
   import _1xa.AppendingLineBuilder;
   import flash.display.Bitmap;
   import _17B_._I_4;
   import flash.geom.ColorTransform;
   import flash.events.Event;
   import _0xn._1uk;
   
   public class _08i extends Sprite
   {
       
      
      protected var _zc:Shape;
      
      protected var _1yl:Shape;
      
      protected var bg:Shape;
      
      private var _1D___:SimpleText;
      
      private var _2b:_dU_;
      
      private var _U_k:SimpleText;
      
      private var _0nA_:AppendingLineBuilder;
      
      protected var itemSprite:Sprite;
      
      protected var itemSlotSprite:Bitmap;
      
      protected var _O_M_:_I_4;
      
      public var itemId:int = -1;
      
      public var slotId:int = -1;
      
      public var objectId:int = -1;
      
      public function _08i()
      {
         this._zc = _1uk._17F_(46,5526612,0,false,true);
         this._1yl = _1uk._17F_(40,5526612,3,false,true);
         this.bg = _1uk._17F_(46,5526612,0,true,false);
         this._1D___ = _1uk._1P_k();
         this._2b = new _dU_();
         this._U_k = _1uk._gZ_(16777103,100);
         this._0nA_ = new AppendingLineBuilder();
         this.itemSprite = new Sprite();
         this.itemSlotSprite = new Bitmap();
         super();
         this._0sF_();
         this._U_k.textChanged.add(this._1U_8);
         this._1D___.textChanged.add(this._1U_8);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      public function setTitle(param1:String, param2:Object) : void
      {
         this._2b.setParams(param1,param2);
         this._1D___.setStringBuilder(this._2b);
      }
      
      public function setDescription(param1:String, param2:Object) : void
      {
         this._0nA_.clear();
         this._0nA_.pushParams(param1,param2);
         this._U_k.setStringBuilder(this._0nA_);
      }
      
      public function _1vP_(param1:Boolean) : void
      {
         this._zc.visible = !param1;
         var _loc2_:int = !!param1?40:46;
         var _loc3_:int = !!param1?3:0;
         this.bg.graphics.clear();
         this.bg.graphics.beginFill(4605510);
         this.bg.graphics.drawRoundRect(0,_loc3_,_loc2_,_loc2_,16,16);
         this.bg.x = (100 - _loc2_) * 0.5;
      }
      
      public function _0vi(param1:Boolean, param2:int = 16777103, param3:Boolean = false) : void
      {
         var _loc4_:ColorTransform = null;
         var _loc5_:ColorTransform = this._1yl.transform.colorTransform;
         _loc5_.color = !!param1?uint(param2):uint(5526612);
         this._1yl.transform.colorTransform = _loc5_;
         if(this._zc.visible)
         {
            _loc4_ = this._zc.transform.colorTransform;
            _loc4_.color = !!param3?uint(param2):uint(5526612);
            this._zc.transform.colorTransform = _loc4_;
         }
      }
      
      protected function _0du() : void
      {
         this.itemSprite.x = 0;
         this.itemSprite.y = 0;
         this.itemSlotSprite.x = (100 - this.itemSlotSprite.width) * 0.5;
         this.itemSlotSprite.y = (46 - this.itemSlotSprite.height) * 0.5;
      }
      
      protected function _1B_t() : void
      {
         this._O_M_.x = (100 - this._O_M_.width) * 0.5;
         this._O_M_.y = (46 - this._O_M_.height) * 0.5;
      }
      
      protected function onRemovedFromStage(param1:Event) : void
      {
         removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         this._U_k.textChanged.remove(this._1U_8);
         this._1D___.textChanged.remove(this._1U_8);
      }
      
      private function _0sF_() : void
      {
         this.itemSprite.addChild(this.itemSlotSprite);
         addChild(this.bg);
         addChild(this._1yl);
         addChild(this._zc);
         addChild(this._1D___);
         addChild(this._U_k);
         addChild(this.itemSprite);
      }
      
      private function _1U_8() : void
      {
         this._U_k.y = this._1D___.y + this._1D___.height - 1;
      }
   }
}
