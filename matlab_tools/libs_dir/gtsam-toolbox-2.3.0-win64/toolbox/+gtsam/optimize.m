function varargout = optimize(varargin)
if length(varargin) == 1 && isa(varargin{1},'gtsam.GaussianBayesTree')
    varargout{1} = gtsam_wrapper(2147, varargin{:});
else
    error('Arguments do not match any overload of function gtsam.optimize');
end
