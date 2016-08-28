package _P_N_
{
   import flash.display.Sprite;
   import _T_n._14v;
   import _1un.Size;
   import flash.display.DisplayObject;
   
   public class _0K_x extends Sprite
   {
       
      
      public var list:_14v;
      
      private var size:Size;
      
      private var _1eZ_:Sprite;
      
      private var _1C_z:Vector.<DisplayObject>;
      
      private var _1kJ_:Array;
      
      private var _kf:int;
      
      private var padding:int;
      
      private var _0cS_:Array;
      
      private var _10o:int;
      
      public function _0K_x()
      {
         this.list = new _14v();
         super();
      }
      
      public function setSize(param1:Size) : void
      {
         this.size = param1;
         this.list.setSize(param1);
         addChild(this.list);
      }
      
      public function _1gC_(param1:int) : void
      {
         this.padding = param1;
         this.list._1gC_(param1);
      }
      
      public function setItems(param1:Array) : void
      {
         var _loc2_:DisplayObject = null;
         this._1G_G_();
         for each(_loc2_ in param1)
         {
            this.addItem(_loc2_);
         }
         this.list.setItems(this._1C_z);
         if(!param1.length)
         {
            return;
         }
         var _loc3_:DisplayObject = param1[0];
         this._10o = this._83() / _loc3_.width;
      }
      
      public function _1X_Q_() : Size
      {
         return this.size;
      }
      
      public function _1D_b() : Array
      {
         return this._1kJ_;
      }
      
      public function getItem(param1:int) : DisplayObject
      {
         return this._1kJ_[param1];
      }
      
      private function _1G_G_() : void
      {
         this._0cS_ = [];
         this._1kJ_ = [];
         this._1C_z = new Vector.<DisplayObject>();
         this._kf = 0;
         this._0rI_();
      }
      
      private function addItem(param1:DisplayObject) : void
      {
         this.position(param1);
         this._1eZ_.addChild(param1);
         this._1kJ_.push(param1);
         this._0cS_[this._0cS_.length - 1].push(param1);
      }
      
      private function position(param1:DisplayObject) : void
      {
         if(this._a(param1))
         {
            param1.x = 0;
            this._0rI_();
         }
         else
         {
            this._1N_D_(param1);
         }
         this._kf = param1.x + param1.width;
         this._kf = this._kf + this.padding;
      }
      
      private function _0rI_() : void
      {
         this._1eZ_ = new Sprite();
         this._1C_z.push(this._1eZ_);
         this._0cS_.push([]);
      }
      
      private function _1N_D_(param1:DisplayObject) : void
      {
         param1.x = this._kf;
      }
      
      private function _a(param1:DisplayObject) : Boolean
      {
         return this._kf + param1.width > this._83();
      }
      
      private function _83() : int
      {
         return this.size.width - _14v._0hX_;
      }
      
      public function _076() : DisplayObject
      {
         if(this._1kJ_.length)
         {
            return this._1kJ_[0];
         }
         return null;
      }
      
      public function _1t8() : DisplayObject
      {
         var _loc1_:Array = null;
         if(this._0cS_.length)
         {
            _loc1_ = this._0cS_[0];
            return _loc1_[this._10o - 1];
         }
         return null;
      }
      
      public function _0D_W_() : DisplayObject
      {
         var _loc1_:Array = null;
         if(this._0cS_.length >= 2)
         {
            _loc1_ = this._0cS_[this._0cS_.length - 1];
            return _loc1_[0];
         }
         return null;
      }
      
      public function _0qb() : DisplayObject
      {
         var _loc1_:Array = null;
         if(this._0cS_.length >= 2)
         {
            _loc1_ = this._0cS_[this._0cS_.length - 1];
            return _loc1_[this._10o - 1];
         }
         return null;
      }
   }
}
