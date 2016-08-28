package _A_4
{
   import flash.display.Sprite;
   import _T_n._14v;
   import flash.display.DisplayObject;
   import _1un.Size;
   
   public class _zp extends Sprite
   {
      
      public static const _0ci:int = 5;
      
      public static const WIDTH:int = 442;
      
      public static const HEIGHT:int = 400;
       
      
      private const list:_14v = this._10d();
      
      private var _1kJ_:Vector.<DisplayObject>;
      
      public function _zp()
      {
         super();
      }
      
      private function _10d() : _14v
      {
         var _loc1_:_14v = new _14v();
         _loc1_.setSize(new Size(WIDTH,HEIGHT));
         _loc1_._0o0.add(this._0F_s);
         _loc1_._1gC_(_0ci);
         addChild(_loc1_);
         return _loc1_;
      }
      
      public function setItems(param1:Vector.<DisplayObject>) : void
      {
         this._1kJ_ = param1;
         this.list.setItems(param1);
         this._0F_s(this.list._1uN_());
      }
      
      private function _0F_s(param1:Boolean) : void
      {
         var _loc2_:CharacterSkinListItem = null;
         var _loc3_:int = CharacterSkinListItem.WIDTH;
         if(!param1)
         {
            _loc3_ = _loc3_ + _14v._0hX_;
         }
         for each(_loc2_ in this._1kJ_)
         {
            _loc2_.setWidth(_loc3_);
         }
      }
      
      public function _sz() : Number
      {
         return this.list._sz();
      }
   }
}
