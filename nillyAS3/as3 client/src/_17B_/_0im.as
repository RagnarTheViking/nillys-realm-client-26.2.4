package _17B_
{
   import ToolTips.ToolTip;
   import flash.display.Sprite;
   import _1gF_.SimpleText;
   import _1F_z._gC_;
   import _1xa._dU_;
   import _0xn._bf;
   import _0xn._1uk;
   
   public class _0im extends ToolTip
   {
       
      
      private const _0K_5:Sprite = new Sprite();
      
      private const _set:SimpleText = _1uk._01t(16777215,16,true,true);
      
      private const _1jG_:SimpleText = _1uk._01t(16777215,14,false,true);
      
      private var _0d4:_gC_;
      
      public function _0im(param1:_gC_)
      {
         super(3552822,1,16777215,1,true);
         this._1jG_.setTextWidth(200).setWordWrap(true);
         this._0d4 = param1;
         this._0sF_();
         this._1__b();
      }
      
      private function _1__b() : void
      {
         _01T_.push(this._set.textChanged);
         _01T_.push(this._1jG_.textChanged);
         this._set.setStringBuilder(new _dU_().setParams(this._0d4.name));
         this._1jG_.setStringBuilder(new _dU_().setParams(this._0d4.description));
      }
      
      private function _0sF_() : void
      {
         this._0K_5.addChild(this._set);
         this._0K_5.addChild(this._1jG_);
         addChild(this._0K_5);
      }
      
      override protected function alignUI() : void
      {
         this._set.x = _bf._0zd;
         this._set.y = _bf._G_F_;
         this._1jG_.x = _bf._0zd;
         this._1jG_.y = this._set.y + this._set.height;
      }
   }
}
