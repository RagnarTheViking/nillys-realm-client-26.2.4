package _qO_
{
   import _2F_.Console;
   import flash.text.TextField;
   import flash.geom.Rectangle;
   import _1wl._1H_v;
   import flash.events.Event;
   import flash.text.TextFieldAutoSize;
   
   public class _1Y_B_
   {
       
      
      private var console:Console;
      
      private var _mainPanel:_qO_._0oV_;
      
      private var _kY_:_qO_._1xe;
      
      private var _E_n:_qO_._1Y_h;
      
      private var _1A_l:_qO_._1t7;
      
      private var _0Z_z:_qO_._1t7;
      
      private var _1p2:Object;
      
      private var _0W_p:uint = 0;
      
      private var _nd:TextField;
      
      private var _wH_:Boolean;
      
      public function _1Y_B_(param1:Console)
      {
         this._1p2 = {};
         super();
         this.console = param1;
         this._mainPanel = new _qO_._0oV_(this.console);
         this._nd = this.mainPanel._1ae("tooltip",true);
         this._nd.mouseEnabled = false;
         this._nd.autoSize = TextFieldAutoSize.CENTER;
         this._nd.multiline = true;
         this._0B_(this._mainPanel);
      }
      
      public function _0B_(param1:_0M_f) : void
      {
         if(this.console.contains(this._nd))
         {
            this.console.addChildAt(param1,this.console.getChildIndex(this._nd));
         }
         else
         {
            this.console.addChild(param1);
         }
         param1.addEventListener(_0M_f._0wA_,this._1E_,false,0,true);
         param1.addEventListener(_0M_f._1qi,this._1E_,false,0,true);
      }
      
      public function _0P_B_(param1:String) : void
      {
         var _loc2_:_0M_f = this.console.getChildByName(param1) as _0M_f;
         if(_loc2_)
         {
            _loc2_.close();
         }
      }
      
      public function getPanel(param1:String) : _0M_f
      {
         return this.console.getChildByName(param1) as _0M_f;
      }
      
      public function get mainPanel() : _qO_._0oV_
      {
         return this._mainPanel;
      }
      
      public function _0M_S_(param1:String) : Boolean
      {
         return !!(this.console.getChildByName(param1) as _0M_f)?true:false;
      }
      
      public function _0T_7(param1:String, param2:Rectangle) : void
      {
         var _loc3_:_0M_f = null;
         _loc3_ = this.getPanel(param1);
         if(_loc3_)
         {
            _loc3_.x = param2.x;
            _loc3_.y = param2.y;
            if(param2.width)
            {
               _loc3_.width = param2.width;
            }
            if(param2.height)
            {
               _loc3_.height = param2.height;
            }
         }
      }
      
      public function updateMenu() : void
      {
         this._mainPanel.updateMenu();
         var _loc1_:_qO_._1Y_h = this.getPanel(_qO_._1Y_h.NAME) as _qO_._1Y_h;
         if(_loc1_)
         {
            _loc1_.update();
         }
      }
      
      public function update(param1:Boolean, param2:Boolean) : void
      {
         this._wH_ = !param1;
         this._mainPanel.update(!param1 && param2);
         if(!param1)
         {
            if(param2 && this._E_n != null)
            {
               this._E_n.update();
            }
         }
      }
      
      public function updateGraphs(param1:Array) : void
      {
         var _loc2_:Object = null;
         var _loc3_:_1H_v = null;
         var _loc4_:_1H_v = null;
         var _loc5_:_1H_v = null;
         var _loc6_:* = null;
         var _loc7_:String = null;
         var _loc8_:_qO_._1t7 = null;
         var _loc9_:Rectangle = null;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         this._0W_p = 0;
         for each(_loc5_ in param1)
         {
            if(_loc5_.type == _1H_v._1C_F_)
            {
               _loc3_ = _loc5_;
            }
            else if(_loc5_.type == _1H_v._06g)
            {
               _loc4_ = _loc5_;
            }
            else
            {
               _loc7_ = _loc5_.name;
               _loc8_ = this._1p2[_loc7_] as _qO_._1t7;
               if(!_loc8_)
               {
                  _loc9_ = _loc5_.rect;
                  if(_loc9_ == null)
                  {
                     _loc9_ = new Rectangle(NaN,NaN,0,0);
                  }
                  _loc10_ = 100;
                  if(isNaN(_loc9_.x) || isNaN(_loc9_.y))
                  {
                     if(this._mainPanel.width < 150)
                     {
                        _loc10_ = 50;
                     }
                     _loc11_ = Math.floor(this._mainPanel.width / _loc10_) - 1;
                     if(_loc11_ <= 1)
                     {
                        _loc11_ = 2;
                     }
                     _loc12_ = this._0W_p % _loc11_;
                     _loc13_ = Math.floor(this._0W_p / _loc11_);
                     _loc9_.x = this._mainPanel.x + _loc10_ + _loc12_ * _loc10_;
                     _loc9_.y = this._mainPanel.y + _loc10_ * 0.6 + _loc13_ * _loc10_;
                     this._0W_p++;
                  }
                  if(_loc9_.width <= 0 || isNaN(_loc9_.width))
                  {
                     _loc9_.width = _loc10_;
                  }
                  if(_loc9_.height <= 0 || isNaN(_loc9_.height))
                  {
                     _loc9_.height = _loc10_;
                  }
                  _loc8_ = new _qO_._1t7(this.console,_loc9_.width,_loc9_.height);
                  _loc8_.x = _loc9_.x;
                  _loc8_.y = _loc9_.y;
                  _loc8_.name = "graph_" + _loc7_;
                  this._1p2[_loc7_] = _loc8_;
                  this._0B_(_loc8_);
               }
               if(_loc2_ == null)
               {
                  _loc2_ = {};
               }
               _loc2_[_loc7_] = true;
               _loc8_.update(_loc5_,this._wH_);
            }
         }
         for(_loc6_ in this._1p2)
         {
            if(_loc2_ == null || !_loc2_[_loc6_])
            {
               this._1p2[_loc6_].close();
               delete this._1p2[_loc6_];
            }
         }
         if(_loc3_ != null)
         {
            if(this._1A_l == null)
            {
               this._1A_l = new _qO_._1t7(this.console,80,40,_qO_._1t7._1C_F_);
               this._1A_l.name = _qO_._1t7._1C_F_;
               this._1A_l.x = this._mainPanel.x + this._mainPanel.width - 160;
               this._1A_l.y = this._mainPanel.y + 15;
               this._0B_(this._1A_l);
               this._mainPanel.updateMenu();
            }
            this._1A_l.update(_loc3_,this._wH_);
         }
         else if(this._1A_l != null)
         {
            this._0P_B_(_qO_._1t7._1C_F_);
            this._1A_l = null;
         }
         if(_loc4_ != null)
         {
            if(this._0Z_z == null)
            {
               this._0Z_z = new _qO_._1t7(this.console,80,40,_qO_._1t7._06g);
               this._0Z_z.name = _qO_._1t7._06g;
               this._0Z_z.x = this._mainPanel.x + this._mainPanel.width - 80;
               this._0Z_z.y = this._mainPanel.y + 15;
               this._0B_(this._0Z_z);
               this._mainPanel.updateMenu();
            }
            this._0Z_z.update(_loc4_,this._wH_);
         }
         else if(this._0Z_z != null)
         {
            this._0P_B_(_qO_._1t7._06g);
            this._0Z_z = null;
         }
         this._wH_ = false;
      }
      
      public function removeGraph(param1:_1H_v) : void
      {
         var _loc2_:_qO_._1t7 = null;
         if(this._1A_l && param1 == this._1A_l.group)
         {
            this._1A_l.close();
            this._1A_l = null;
         }
         else if(this._0Z_z && param1 == this._0Z_z.group)
         {
            this._0Z_z.close();
            this._0Z_z = null;
         }
         else
         {
            _loc2_ = this._1p2[param1.name];
            if(_loc2_)
            {
               _loc2_.close();
               delete this._1p2[param1.name];
            }
         }
      }
      
      public function get displayRoller() : Boolean
      {
         return !!(this.getPanel(_n4.NAME) as _n4)?true:false;
      }
      
      public function set displayRoller(param1:Boolean) : void
      {
         var _loc2_:_n4 = null;
         if(this.displayRoller != param1)
         {
            if(param1)
            {
               if(this.console.config.displayRollerEnabled)
               {
                  _loc2_ = new _n4(this.console);
                  _loc2_.x = this._mainPanel.x + this._mainPanel.width - 180;
                  _loc2_.y = this._mainPanel.y + 55;
                  this._0B_(_loc2_);
               }
               else
               {
                  this.console.report("Display roller is disabled in config.",9);
               }
            }
            else
            {
               this._0P_B_(_n4.NAME);
            }
            this._mainPanel.updateMenu();
         }
      }
      
      public function get channelsPanel() : Boolean
      {
         return this._E_n != null;
      }
      
      public function set channelsPanel(param1:Boolean) : void
      {
         if(this.channelsPanel != param1)
         {
            this.console.logs._1a__();
            if(param1)
            {
               this._E_n = new _qO_._1Y_h(this.console);
               this._E_n.x = this._mainPanel.x + this._mainPanel.width - 332;
               this._E_n.y = this._mainPanel.y - 2;
               this._0B_(this._E_n);
               this._E_n.update();
               this.updateMenu();
            }
            else
            {
               this._0P_B_(_qO_._1Y_h.NAME);
               this._E_n = null;
            }
            this.updateMenu();
         }
      }
      
      public function get memoryMonitor() : Boolean
      {
         return this._0Z_z != null;
      }
      
      public function get fpsMonitor() : Boolean
      {
         return this._1A_l != null;
      }
      
      public function tooltip(param1:String = null, param2:_0M_f = null) : void
      {
         var _loc3_:Array = null;
         var _loc4_:Rectangle = null;
         var _loc5_:Rectangle = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         if(param1 && !this.rulerActive)
         {
            _loc3_ = param1.split("::");
            param1 = _loc3_[0];
            if(_loc3_.length > 1)
            {
               param1 = param1 + ("<br/><low>" + _loc3_[1] + "</low>");
            }
            this.console.addChild(this._nd);
            this._nd.wordWrap = false;
            this._nd.htmlText = "<tt>" + param1 + "</tt>";
            if(this._nd.width > 120)
            {
               this._nd.width = 120;
               this._nd.wordWrap = true;
            }
            this._nd.x = this.console.mouseX - this._nd.width / 2;
            this._nd.y = this.console.mouseY + 20;
            if(param2)
            {
               _loc4_ = this._nd.getBounds(this.console);
               _loc5_ = new Rectangle(param2.x,param2.y,param2.width,param2.height);
               _loc6_ = _loc4_.bottom - _loc5_.bottom;
               if(_loc6_ > 0)
               {
                  if(this._nd.y - _loc6_ > this.console.mouseY + 15)
                  {
                     this._nd.y = this._nd.y - _loc6_;
                  }
                  else if(_loc5_.y < this.console.mouseY - 24 && _loc4_.y > _loc5_.bottom)
                  {
                     this._nd.y = this.console.mouseY - this._nd.height - 15;
                  }
               }
               _loc7_ = _loc4_.left - _loc5_.left;
               _loc8_ = _loc4_.right - _loc5_.right;
               if(_loc7_ < 0)
               {
                  this._nd.x = this._nd.x - _loc7_;
               }
               else if(_loc8_ > 0)
               {
                  this._nd.x = this._nd.x - _loc8_;
               }
            }
         }
         else if(this.console.contains(this._nd))
         {
            this.console.removeChild(this._nd);
         }
      }
      
      public function startRuler() : void
      {
         if(this.rulerActive)
         {
            return;
         }
         this._kY_ = new _qO_._1xe(this.console);
         this._kY_.addEventListener(Event.COMPLETE,this._0Y_M_,false,0,true);
         this.console.addChild(this._kY_);
         this._mainPanel.updateMenu();
      }
      
      public function get rulerActive() : Boolean
      {
         return this._kY_ && this.console.contains(this._kY_)?true:false;
      }
      
      private function _0Y_M_(param1:Event) : void
      {
         if(this._kY_ && this.console.contains(this._kY_))
         {
            this.console.removeChild(this._kY_);
         }
         this._kY_ = null;
         this._mainPanel.updateMenu();
      }
      
      private function _1E_(param1:Event) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:_0M_f = null;
         var _loc7_:_0M_f = param1.currentTarget as _0M_f;
         if(this.console.config.style._16G_)
         {
            _loc2_ = [0];
            _loc3_ = [0];
            if(this.console.stage)
            {
               this.console.stage;
               _loc2_.push(800);
               this.console.stage;
               _loc3_.push(600);
            }
            _loc4_ = this.console.numChildren;
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc6_ = this.console.getChildAt(_loc5_) as _0M_f;
               if(_loc6_ && _loc6_.visible)
               {
                  _loc2_.push(_loc6_.x,_loc6_.x + _loc6_.width);
                  _loc3_.push(_loc6_.y,_loc6_.y + _loc6_.height);
               }
               _loc5_++;
            }
            _loc7_._1I_U_(_loc2_,_loc3_);
         }
      }
   }
}
